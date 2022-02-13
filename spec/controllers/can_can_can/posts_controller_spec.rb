require 'rails_helper'

describe CanCanCan::PostsController, type: :controller do
  before :all do
    @user = User.new("Rocky", false)
    @other_user = User.new("Apollo", false)
    @admin = User.new("Micky", true)

    @draft_post = Post.create(
      title: "KFI",
      body: "Kentucky Fried Idiot",
      author: @user.name,
      published: false
    )
    @other_draft_post = Post.create(
      title: "Drop him in three",
      body: "Southpaw nothing. I'll drop him in three.",
      author: @other_user.name,
      published: false
    )

    @published_post = Post.create(
      title: "WWL",
      body: "Women. Weaken. Legs.",
      author: @admin.name,
      published: true
    )
  end

  describe "#show" do
    it "should return success when viewing a published post" do
      get :show, params: { id: @published_post.id }, session: { current_user: "Rocky" }
      expect(response.status).to eq 200
    end

    it "should return success when viewing my own draft post" do
      get :show, params: { id: @draft_post.id }, session: { current_user: "Rocky" }
      expect(response.status).to eq 200
    end

    it "should raise and error when trying to view draft post from another user" do
      expect {
        get :show, params: { id: @other_draft_post.id }, session: { current_user: "Rocky" }
      }.to raise_error
    end

    describe "as admin" do
      it "should return success when viewing draft post from another user" do
        get :show, params: { id: @other_draft_post.id }, session: { current_user: "Micky" }
        expect(response.status).to eq 200
      end
    end
  end

  describe "#destroy" do
    it "should return success destroying your own post" do
      delete :destroy, params: { id: @draft_post.id }, session: { current_user: "Rocky" }
    end

    it "should raise an error when attempting to destroy another users post" do
      expect {
        delete :destroy, params: { id: @other_draft_post.id }, session: { current_user: "Rocky" }
      }.to raise_error
    end

    describe "as admin" do
      it "should raise an error when attempting to destroy another users post" do
        expect {
          delete :destroy, params: { id: @other_draft_post.id }, session: { current_user: "Micky" }
        }.to raise_error
      end
    end
  end

  describe "#index" do
    render_views

    describe "regular user" do
      it "should return all published posts" do
        get :index, session: { current_user: "Rocky" }
        expect(response.body).to include @published_post.title
      end

      it "should return all of my own draft posts" do
        get :index, session: { current_user: "Rocky" }
        expect(response.body).to include @draft_post.title
      end

      it "should not return draft posts for another user" do
        get :index, session: { current_user: "Rocky" }
        expect(response.body).not_to include @other_draft_post.title
      end
    end

    describe "admin user" do
      it "should return all published posts" do
        get :index, session: { current_user: "Micky" }
        expect(response.body).to include @published_post.title
      end

      it "should return all draft posts" do
        get :index, session: { current_user: "Micky" }
        expect(response.body).to include @draft_post.title
        expect(response.body).to include @other_draft_post.title
      end
    end
  end
end

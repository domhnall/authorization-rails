RSpec.shared_context "authorized posts controller context" do
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
end

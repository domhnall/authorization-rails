class PostPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def show?
    post.published ||
      user.is_admin ||
      (user.name == post.author)
  end

  def destroy?
    user.name == post.author
  end


  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user.is_admin
        scope.all
      else
        scope.where(published: true).or(scope.where(author: user.name))
      end
    end
  end
end

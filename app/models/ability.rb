class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post, published: true

    return unless user.present?  # additional permissions for logged in users (they can read their own posts)
    can :read, Post, author: user.name
    can :destroy, Post, author: user.name

    return unless user.is_admin  # additional permissions for administrators
    can :read, Post
  end
end

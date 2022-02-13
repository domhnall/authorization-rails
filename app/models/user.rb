class User
  attr_reader :name, :is_admin
  USERS = []

  def initialize(name, is_admin=false)
    @name = name
    @is_admin = is_admin
    USERS << self
  end

  def self.jack
    User.find("jack")
  end

  def self.jill
    User.find("jill")
  end

  def self.find(name)
    USERS.find{ |u| u.name == name }
  end
end

User.new("jack", false)
User.new("jill", true)

class User < Struct.new(:name, :is_admin)
  def self.jack
    User.new("jack", false)
  end

  def self.jill
    User.new("jill", true)
  end
end

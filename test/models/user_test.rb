require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should create user with valid attributes" do
    user = User.new(email: "test@example.com", password: "password", role: "customer")
    assert user.valid?
  end

  test "admin? returns true for admin role" do
    user = User.new(email: "admin@example.com", password: "password", role: "admin")
    assert user.admin?
  end

  test "customer? returns true for customer role" do
    user = User.new(email: "customer@example.com", password: "password", role: "customer")
    assert user.customer?
  end
end

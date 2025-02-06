require "test_helper"

class UserTest < ActiveSupport::TestCase
  # create user with valid data
  test "should create user with valid attributes" do
    # Create a new user with valid data
    user = User.new(
      email: "testing789@example.com",
      password: "password123",
      password_confirmation: "password123"
    )
    
    binding.irb  # Test will pause like 'debugger'
      # Type 'user.valid?' to check validations
      # Type 'user.errors.full_messages' to see any errors
      # Type exit to continue

    # Assert the user is valid and saves successfully
    assert user.valid?
    assert user.save
  end

  test "should not create user without email" do
    # Try to create user without email
    user = User.new(
      password: "password123",
      password_confirmation: "password123"
    )
    
    # Assert the user is not valid and won't save
    assert_not user.valid?
    assert_not user.save
  end
end

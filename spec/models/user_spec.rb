require 'rails_helper'

RSpec.describe User, :type => :model do
  it "is not valid without a username" do
    username = User.new(username: nil)
    expect(username).to_not be_valid
  end

   it "is not valid without a full name" do
    fullname = User.new(fullname: nil)
    expect(fullname).to_not be_valid
  end

   it "is not valid without an email" do
    email = User.new(email: nil)
    expect(email).to_not be_valid
  end
end
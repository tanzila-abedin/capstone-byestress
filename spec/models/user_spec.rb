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


it 'has many likes' do
 like = User.reflect_on_association(:likes)
 expect(like.macro).to eq(:has_many)
end

it 'has many micropost' do
 micropost = User.reflect_on_association(:microposts)
 expect(micropost.macro).to eq(:has_many)
end

it 'has many following' do
 following = User.reflect_on_association(:following)
 expect(following.macro).to eq(:has_many)
end

it 'has many followers' do
 followers = User.reflect_on_association(:followers)
 expect(followers.macro).to eq(:has_many)
end

end


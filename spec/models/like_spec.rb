require 'rails_helper'

RSpec.describe Like, type: :model do
 it 'should belong to user' do
 user = Like.reflect_on_association(:user)
 expect(user.macro).to eq(:belongs_to)
end

it 'should belong to micropost' do
 micropost = Like.reflect_on_association(:micropost)
 expect(micropost.macro).to eq(:belongs_to)
end
end


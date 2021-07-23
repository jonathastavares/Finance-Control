require 'rails_helper'
RSpec.describe User, type: :model do
  context 'User/Entities relations' do
    it 'Checks associations between User and Entities' do
      user = User.create!(username: 'testuser')
      entity = Entity.create!(name: 'testentity', amount: '0', user_id: user.id)
      expect(user.entities).to eq([entity])
    end
  end
  context 'User/Groups relations' do
    it 'Checks associations between User and Groups' do
      user = User.create!(username: 'testuser')
      group = Group.create!(name: 'testgroup', user_id: user.id)
      expect(user.groups).to eq([group])
    end
  end
end

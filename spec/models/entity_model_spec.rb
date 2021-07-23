require 'rails_helper'
RSpec.describe Entity, type: :model do
  context 'Entity/User relations' do
    it 'Checks associations between Entities and User' do
      user = User.create!(username: 'testuser')
      entity = Entity.create!(name: 'testentity', amount: '0', user_id: user.id)
      expect(entity.creator).to eq(user)
    end
  end
  context 'Entity/Groups relations' do
    it 'Checks associations between Entities and Groups' do
      user = User.create!(username: 'testuser')
      group = Group.create!(name: 'testgroup', user_id: user.id)
      entity = Entity.create!(name: 'testentity', amount: '0', user_id: user.id, group_id: group.id)
      expect(entity.group).to eq(group)
    end
  end
end

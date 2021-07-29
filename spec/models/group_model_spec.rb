require 'rails_helper'
RSpec.describe Group, type: :model do
  context 'Group/User relations' do
    it 'Checks associations between Groups and User' do
      user = User.create!(username: 'testuser')
      group = Group.create!(name: 'testgroup', user_id: user.id)
      expect(group.creator).to eq(user)
      expect(group.creator).to_not eq([user])
    end
  end
  context 'Groups/Entity relations' do
    it 'Checks associations between Groups and Entities' do
      user = User.create!(username: 'testuser')
      group = Group.create!(name: 'testgroup', user_id: user.id)
      entity = Entity.create!(name: 'testentity', amount: '0', user_id: user.id, group_id: group.id)
      entity2 = Entity.create!(name: 'testentity2', amount: '1', user_id: user.id, group_id: group.id)
      relation = Relation.create!(entity_id: entity.id, group_id: group.id)
      relation = Relation.create!(entity_id: entity2.id, group_id: group.id)
      expect(group.entities).to eq([entity, entity2])
      expect(group.entities).to_not eq([entity])
      expect(group.entities).to_not eq([entity2])
    end
  end
end

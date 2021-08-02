require 'rails_helper'
# rubocop:disable Lint/UselessAssignment
RSpec.describe Entity, type: :model do
  context 'Entity/User relations' do
    it 'Checks associations between Entities and User' do
      user = User.create!(username: 'testuser')
      entity = Entity.create!(name: 'testentity', amount: '0', user_id: user.id)
      expect(entity.creator).to eq(user)
      expect(entity.creator).to_not eq(user.username)
      expect(entity.creator).to_not eq(user.id)
    end
  end
  context 'Entity/Groups relations' do
    it 'Checks associations between Entities and Groups' do
      user = User.create!(username: 'testuser')
      group = Group.create!(name: 'testgroup', user_id: user.id)
      entity = Entity.create!(name: 'testentity', amount: '0', user_id: user.id, group_id: group.id)
      entity2 = Entity.create!(name: 'testentity2', amount: '1', user_id: user.id, group_id: group.id)
      relation = Relation.create!(entity_id: entity.id, group_id: group.id)
      relation = Relation.create!(entity_id: entity2.id, group_id: group.id)
      expect(entity.groups).to eq([group])
      expect(entity.groups).to_not eq(group)
    end
  end
end
# rubocop:enable Lint/UselessAssignment

# rubocop:disable Layout/LineLength
module GroupHelper
  def show_groups
    content = ''
    current_user.groups.each do |group|
      content +=
        "<a href='/group/transactions?id=#{group.id}', class='groups w-75'><div class='card d-flex flex-row'>
          <div class='card-body justify-content-flex-end d-flex'>
            <img #{group_img_path(group)}, class='group-image' %>
            <h5 class='card-title w-75'>#{group.name}</h5>
          </div>
          <div class='card-body'>
            <p class='card-text'>Transactions: #{group.entities.length}</p>
            <a href='/groups/delete?group_id=#{group.id}', class='groups btn btn-success', method: :delete, data-confirm='Are you sure to delete this item?'>Delete</a>
          </div>
        </div></a>"
    end
    content.html_safe
  end

  def show_assigneable_groups
    content = ''
    current_user.groups.each do |group|
      content +=
        "<div class='card d-flex flex-row'>
          <div class='card-body w-100 d-flex align-items-center'>
            <input type='checkbox', name='#{group.name}', value='#{group.id}', { multiple: true }, id='checkbox'>
            <img #{group_img_path(group)}, class='group-image ml-2 mr-2' %>
            <h5 class='card-title w-75'>#{group.name}</h5>
          </div>
          <div class='card-body'>
            <p class='card-text'>Transactions: #{group.entities.length}</p>
          </div>
        </div>"
    end
    content.html_safe
  end

  def show_group_transactions
    content = ''
    transactions = @group.entities.sort { |a, b| b <=> a }
    transactions.each do |entity|
      content +=
        "<div class='card d-flex flex-row'>
          <div class='card-body w-50'>
            <h5 class='card-title mb-5'>#{entity.name}</h5>
            <p class='card-text'>Created by: #{entity.creator.username}</p>
          </div>
          <div class='card-body'>
            <p class='card-text', style='font-weight: bolder;'>$ #{entity.amount}</p>
            <a href='/external_transactions/assign?entity_id=#{entity.id}', class='groups btn btn-success'>Re-Assign</a>
          </div>
        </div>"
    end
    content.html_safe
  end
end
# rubocop:enable Layout/LineLength

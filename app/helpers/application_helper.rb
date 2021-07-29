# rubocop:disable Layout/LineLength
module ApplicationHelper
  def show_transactions
    content = ''
    entities = current_user.entities.reverse
    entities.each do |entity|
      content +=
        "<div class='card d-flex flex-row'>
          <div class='card-body w-50'>
            <div class='w-100 d-flex'>
              <img #{entity_img_path(entity)}, class='group-image' %>
              <h5 class='card-title w-75'>#{entity.name}</h5>
            </div>
            <p class='card-text'>#{entity.created_at}</p>
          </div>
          <div class='card-body'>
            <p class='card-text', style='font-weight: bolder;'>$ #{entity.amount}</p>
            <a href='/transactions/delete?entity_id=#{entity.id}', class='groups btn btn-success', method: :delete, data-confirm='Are you sure to delete this item?'>Delete</a>
          </div>
        </div>"
    end
    content.html_safe
  end

  def profile_img_path
    if @user.image.attached?
      @user.image
    else
      src='default-profile.png'
    end
  end

  def group_img_path(group)
    if group.image.attached?
      "src='#{url_for(group.image)}'".html_safe
    else
      "src='/assets/default-group.jpg'".html_safe
    end
  end

  def entity_img_path(entity)
    if entity.groups.any? && entity.groups[0].image.attached?
      "src='#{url_for(entity.groups[0].image)}'".html_safe
    else
      "src='/assets/default-group.jpg'".html_safe
    end
  end

  def show_external_transactions
    content = ''
    entities = current_user.external_transactions.reverse
    entities.each do |entity|
      content +=
        "<div class='card d-flex flex-row'>
          <div class='card-body w-50'>
            <div class='w-100 d-flex'>
              <img #{entity_img_path(entity)}, class='group-image' %>
              <h5 class='card-title w-75'>#{entity.name}</h5>
            </div>
            <p class='card-text'>#{entity.created_at}</p>
          </div>
          <div class='card-body'>
            <p class='card-text', style='font-weight: bolder;'>$ #{entity.amount}</p>
            <a href='/external_transactions/assign?entity_id=#{entity.id}', class='groups btn btn-success'>Assign</a>
          </div>
        </div>"
    end
    content.html_safe
  end

  def show_total_spent
    total = 0
    current_user.entities.each do |entity|
      total += entity.amount
    end
    total.round(2)
  end

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
            <input type='checkbox', name='#{group.name}', value='#{group.id}', { multiple: true }>
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

  def groups_text
    if current_user.groups.any?
      "<p class='white'> Select Groups you want to assign this transaction, or leave it blank </p>".html_safe
    else
      "<p class='white'> You don't have any groups </p>".html_safe
    end
  end
end
# rubocop:enable Layout/LineLength

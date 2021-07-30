# rubocop:disable Layout/LineLength
module TransactionsHelper
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
end
# rubocop:enable Layout/LineLength

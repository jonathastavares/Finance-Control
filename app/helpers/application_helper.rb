module ApplicationHelper
  def show_entities
    content = ''
    entities = current_user.entities.reverse
    entities.each do |entity|
      content += 
        "<div class='card d-flex flex-row'>
          <div class='card-body'>
            <h5 class='card-title mb-5'>#{entity.name}</h5>
            <p class='card-text'>#{entity.created_at}</p>
          </div>
          <div class='card-body'>
            <p class='card-text', style='font-weight: bolder;'>$ #{entity.amount}</p>
          </div>
        </div>"
    end
    return content.html_safe
  end

  def show_total_spent
    total = 0
    current_user.entities.each do |entity|
      total += entity.amount
    end
    return total
  end
end

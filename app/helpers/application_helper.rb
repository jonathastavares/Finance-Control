# rubocop:disable Lint/UselessAssignment
module ApplicationHelper
  def profile_img_path
    if @user.image.attached?
      @user.image
    else
      src = 'default-profile.png'
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

  def show_total_spent
    total = 0
    current_user.entities.each do |entity|
      total += entity.amount
    end
    total.round(2)
  end

  def groups_text
    if current_user.groups.any?
      "<p class='white'> Select Groups you want to assign this transaction, or leave it blank </p>".html_safe
    else
      "<p class='white'> You don't have any groups </p>".html_safe
    end
  end
end
# rubocop:enable Lint/UselessAssignment

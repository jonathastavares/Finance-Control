module ApplicationHelper
  def show_entities
    content = ''
    current_user.entities.each do |entity|
      content += "<tr>
      <th scope='row'>#{ entity.id }</th>
      <td>#{ entity.name }</td>
      <td>#{ entity.amount }</td>
      <td>#{ entity.created_at }</td>
    </tr>"
    end
    return content.html_safe
  end
end

# frozen_string_literal: true

module ApplicationHelper
  def show_transactions
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
          <div class='card-body'>
            <h5 class='card-title mb-5'>#{entity.name}</h5>
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
    total
  end

  def show_groups
    content = ''
    current_user.groups.each do |group|
      content +=
        "<a href='/group/transactions?id=#{group.id}', class='groups'><div class='card d-flex flex-row'>
          <div class='card-body'>
            <h5 class='card-title mb-5'>#{group.name}</h5>
          </div>
          <div class='card-body'>
            <p class='card-text'>Transactions: #{group.entities.length}</p>
          </div>
        </div></a>"
    end
    content.html_safe
  end

  def show_assigneable_groups
    content = ''
    current_user.groups.each do |group|
      content +=
        "<a href='/external_transactions/assign?id=#{group.id}&entity_id=#{params[:entity_id]}', class='groups'><div class='card d-flex flex-row'>
          <div class='card-body'>
            <h5 class='card-title mb-5'>#{group.name}</h5>
          </div>
          <div class='card-body'>
            <p class='card-text'>Transactions: #{group.entities.length}</p>
          </div>
        </div></a>"
    end
    content.html_safe
  end

  def show_group_transactions
    content = ''
    transactions = @group.entities.sort { |a, b| b <=> a }
    transactions.each do |entity|
      content +=
        "<div class='card d-flex flex-row'>
          <div class='card-body'>
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

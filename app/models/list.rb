class List < ActiveRecord::Base
  belongs_to :user
  has_many :items

  def total_cost
    total = items.reduce(0) { |acc, elem| acc + (elem.price || 0) }
    ActiveSupport::NumberHelper.number_to_currency(total)
  end

  def items_remaining
    items.size - items.select(&:completed).size
  end
end

class List < ActiveRecord::Base
  belongs_to :user
  has_many :items

  validates :name, presence: true

  def total_cost
    items.reduce(0) { |acc, elem| acc + (elem.price || 0) }
  end

  def items_remaining
    items.size - items.select(&:completed).size
  end
end

class Item < ActiveRecord::Base
  belongs_to :list

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
end

class LineItem < ApplicationRecord
  belongs_to :line_item_date

  validates :name, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :unit_price, presence: true, numericality: { greater_than: 0 }

  # Due for this delagation the two following lines are equivalent:
  # line_item.line_item_date.quote
  # line_item.quote
  delegate :quote, to: :line_item_date
end

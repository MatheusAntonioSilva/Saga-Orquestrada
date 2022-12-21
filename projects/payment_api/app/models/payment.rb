class Payment < ApplicationRecord

  validates :description, :order_id, presence: true
end

class Account < ApplicationRecord

  validates :name, :phone, :order_id, presence: true
end

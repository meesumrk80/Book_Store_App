class Order < ApplicationRecord
# user.rb
has_many :orders, dependent: :destroy

# order.rb
belongs_to :user
belongs_to :cart
validates :total, presence: true, numericality: { greater_than_or_equal_to: 0 }
end

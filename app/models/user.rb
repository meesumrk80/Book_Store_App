class User < ApplicationRecord
  # Associations
  has_one :cart, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :orders, dependent: :destroy

  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Enum for roles
  enum :role, { customer: "customer", admin: "admin" }

  # Callbacks
  after_create :create_cart

  # Validations
  validates :email, format: {
    with: /\A[^@\s]+@[^@\s]+\.[^@\s]+\z/,
    message: "must contain a name, @, and a valid domain (e.g. name@example.com)"
  }
  validates :username, presence: true

  # Role helpers
  def admin?
    role == "admin"
  end

  def customer?
    role == "customer"
  end

  private

  def create_cart
    Cart.create(user: self)
  end
end

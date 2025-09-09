class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :cart, dependent: :destroy
  after_create :create_cart
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews, dependent: :destroy
  enum :role, { customer: "customer", admin: "admin" }
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

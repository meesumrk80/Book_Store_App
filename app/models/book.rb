class Book < ApplicationRecord
  has_and_belongs_to_many :categories
  has_one_attached :image

  validates :title, presence: true
  validates :author, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :stock, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :description, presence: true

  has_many :reviews, dependent: :destroy
  scope :search, ->(term) { where("title ILIKE ? OR author ILIKE ?", "%#{term}%", "%#{term}%") if term.present? }
  scope :show_book_category, ->(category_id) { joins(:categories).where(categories: { id: category_id }) if category_id.present? }
end

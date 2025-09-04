class Category < ApplicationRecord
  has_and_belongs_to_many :books
  validates :name, presence: true, uniqueness: true
  def self.addCat(name)
    find_or_create_by(name: name)
  end
end

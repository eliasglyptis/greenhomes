class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :variants
  has_many_attached :photos
  has_rich_text :description

  accepts_nested_attributes_for :variants

  validates :title, presence: { message: 'cannot be blank' }

end

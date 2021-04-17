class Project < ApplicationRecord
  belongs_to :user

  has_rich_text :description

  enum status: [:created, :started, :stopped, :completed]

  validates :name, presence: :true, length: { 
    maximum: 200,
    minimum: 5,
    message: "Please enter a meaningful name between 5 to 200 characters"
  }, on: :update, on: :create
  
  validates :estimated_effort, numericality: { 
    only_integer: true, 
    greater_than_or_equal_to: 1, 
    message: "Estimated effort must be at least 1"
  }
end

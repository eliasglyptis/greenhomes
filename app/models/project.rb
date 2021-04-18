class Project < ApplicationRecord
  belongs_to :user

  has_rich_text :description

  enum status: {Created: 0, Started: 1, Stopped: 2, Completed: 3}
  enum display: {Private: 0, Public: 1}

  validates :name, presence: :true, length: { 
    maximum: 200,
    minimum: 5,
    message: " should be between 5 to 200 characters"
  }, on: :update, on: :create
  
  validates :estimated_effort, numericality: { 
    only_integer: true, 
    greater_than_or_equal_to: 1, 
    message: " must be at least 1"
  }
  validates :description, presence: :true, length: { 
    maximum: 2000,
    minimum: 50, 
    message: " should be meaningful"
  }
end

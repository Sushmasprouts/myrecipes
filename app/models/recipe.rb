class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, length: {minimum:5, maximum:500}
 belongs_to :chef
  validates :chef_id, presence: true
  default_scope -> { order(updated_at: :desc) }
  has_many :recipe_incredients
  has_many :incredients, through: :recipe_incredients
  has_many :comments, dependent: :destroy
end
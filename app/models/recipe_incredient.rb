class RecipeIncredient < ApplicationRecord
  belongs_to :incredient
  belongs_to :recipe
end
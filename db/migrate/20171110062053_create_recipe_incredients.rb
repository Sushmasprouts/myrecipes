class CreateRecipeIncredients < ActiveRecord::Migration[5.0]
  def change
    create_table :recipe_incredients do |t|
      t.integer :recipe_id
      t.integer :incredient_id
    end
  end
end

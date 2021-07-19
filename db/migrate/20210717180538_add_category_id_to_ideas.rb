class AddCategoryIdToIdeas < ActiveRecord::Migration[6.0]
  def change
    add_reference :ideas, :category, foreign_key: true
  end
end

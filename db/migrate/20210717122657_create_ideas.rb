class CreateIdeas < ActiveRecord::Migration[6.0]
  def change
    create_table :ideas, :id => false do |t|
      t.bigint :id, primary_key: true
      t.text :body, null: false

      t.timestamps
    end
  end
end

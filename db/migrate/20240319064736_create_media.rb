class CreateMedia < ActiveRecord::Migration[7.1]
  def change
    create_table :media do |t|
      t.string :title
      t.integer :year
      t.string :category
      t.string :rating
      t.boolean :is_trending

      t.timestamps
    end
  end
end

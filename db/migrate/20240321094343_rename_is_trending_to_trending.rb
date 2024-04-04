class RenameIsTrendingToTrending < ActiveRecord::Migration[7.1]
  def change
    rename_column :media, :is_trending, :trending
  end
end

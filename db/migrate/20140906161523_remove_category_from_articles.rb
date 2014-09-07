class RemoveCategoryFromArticles < ActiveRecord::Migration
  def change	
  	remove_index :articles, :category_id
  	remove_column :articles, :category_id
  end
end

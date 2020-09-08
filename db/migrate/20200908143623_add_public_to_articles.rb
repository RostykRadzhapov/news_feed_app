class AddPublicToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :public, :boolean, default: false
  end
end

class AddArticleClickToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :article_click, :integer, default: 0
  end
end

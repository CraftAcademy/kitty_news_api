class AddAssociationToArticle < ActiveRecord::Migration[6.0]
  def change
    change_table :articles do |t|
    t.belongs_to :category, null: false, foreign_key: true
    end
  end
end

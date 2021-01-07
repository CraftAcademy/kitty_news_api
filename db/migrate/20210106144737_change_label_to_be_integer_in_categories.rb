class ChangeLabelToBeIntegerInCategories < ActiveRecord::Migration[6.0]
  def change
    change_column :categories, :label, :integer, using: 'label::integer'
  end
end

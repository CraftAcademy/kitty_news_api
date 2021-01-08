class ChangeLabelToString < ActiveRecord::Migration[6.0]
  def change
    change_column :categories, :label, :string
  end
end

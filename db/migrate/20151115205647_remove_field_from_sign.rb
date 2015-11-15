class RemoveFieldFromSign < ActiveRecord::Migration
  def change
    remove_column :signs, :image_1, :string
    remove_column :signs, :image_2, :string
  end
end

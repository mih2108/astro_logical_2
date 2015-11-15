class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :helpful
      t.integer :accurate
      t.string :interested
      t.text :comments

      t.timestamps null: false
    end
  end
end

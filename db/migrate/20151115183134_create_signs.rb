class CreateSigns < ActiveRecord::Migration
  def change
    create_table :signs do |t|
      t.string :name
      t.string :image_1
      t.string :image_2
      t.string :birth_range
      t.string :horoscope
      t.string :slug

      t.timestamps null: false
    end
  end
end

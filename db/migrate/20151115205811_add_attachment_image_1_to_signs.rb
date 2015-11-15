class AddAttachmentImage1ToSigns < ActiveRecord::Migration
  def self.up
    change_table :signs do |t|
      t.attachment :image_1
    end
  end

  def self.down
    remove_attachment :signs, :image_1
  end
end

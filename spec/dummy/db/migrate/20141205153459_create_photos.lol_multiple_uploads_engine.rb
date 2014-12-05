# This migration comes from lol_multiple_uploads_engine (originally 20141205141907)
class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :photable_id
      t.string  :photable_type
      t.string  :image
      t.integer :priority
      t.timestamps
    end
  end
end

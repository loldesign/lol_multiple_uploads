class CreateProfile < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.timestamps
    end
  end
end

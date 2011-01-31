class CreateLinks < ActiveRecord::Migration
  def self.up
    create_table :links do |t|
      t.string :href
      t.string :md
      t.string :tag
      t.integer :count

      t.timestamps
    end
  end

  def self.down
    drop_table :links
  end
end

class CreateSubitems < ActiveRecord::Migration[6.1]
  def change
    create_table :subitems do |t|
      t.string      :title
      t.belongs_to  :item
      t.timestamps
    end
  end
end

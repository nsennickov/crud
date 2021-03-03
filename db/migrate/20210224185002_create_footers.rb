class CreateFooters < ActiveRecord::Migration[6.1]
  def change
    create_table :footers do |t|
      t.string :title
      t.string :background
      t.string :color
      t.timestamps
    end
  end
end

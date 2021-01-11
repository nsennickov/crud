# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :todo
      t.boolean :isDone

      t.timestamps
    end
  end
end

class ChangeNameForTableCell < ActiveRecord::Migration[6.1]
  def change
    change_table :items do |t|
      t.rename :isDone, :done
    end
  end
end

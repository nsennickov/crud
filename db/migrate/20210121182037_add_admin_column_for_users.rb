class AddAdminColumnForUsers < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      t.boolean  :admin,    null: false, default: false
    end
  end
end

class AddAssociationWithUser < ActiveRecord::Migration[6.1]
  def change
    change_table :items do |t|
      t.belongs_to :user
    end
  end
end

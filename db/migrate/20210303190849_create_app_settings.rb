class CreateAppSettings < ActiveRecord::Migration[6.1]
  def change
    create_table :app_settings do |t|
      t.string :footer_settings_title
      t.string :footer_settings_background
      t.string :footer_settings_color
      t.timestamps
    end
  end
end

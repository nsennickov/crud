class CangeAppSettings < ActiveRecord::Migration[6.1]
  def change
    change_table :app_settings do |t|
      t.remove :footer_settings_background, :footer_settings_color, :footer_settings_title
      t.text :footer_settings
    end
  end
end

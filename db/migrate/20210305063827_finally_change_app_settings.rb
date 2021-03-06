class FinallyChangeAppSettings < ActiveRecord::Migration[6.1]
  def change
    change_table :app_settings do |t|
      t.remove :footer_settings
      t.string :footer_settings_title
      t.string :footer_settings_background
      t.string :footer_settings_color
    end

  end
end

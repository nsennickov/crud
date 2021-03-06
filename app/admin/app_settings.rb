ActiveAdmin.register AppSetting do
  permit_params :footer_settings_title, :footer_settings_background, :footer_settings_color

  index do
    selectable_column
    id_column
    column :created_at
    column :updated_at
    actions
  end

  show do
    some_settings = AppSetting.last
    some_settings.attributes.each_pair do |k, v|
      if k != 'id'
        panel k.gsub('_settings_', ' ').upcase do
          v
        end
      end
    end
  end

  filter :updated_at
  filter :created_at
end

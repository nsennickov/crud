ActiveAdmin.register AppSetting do
  permit_params :footer_settings_title, :footer_settings_background, :footer_settings_color, updated_at: Time.now

  member_action :update do
    some_settings = AppSetting.find(params[:id])
    if some_settings.update!(permitted_params[:app_setting])
      redirect_to admin_app_settings_path
    else
      redirect_to edit_admin_app_setting(some_settings)
      flash some_settings.error.message
    end
  end

  show do
    h3 'ALOALALAL'
    some_settings = AppSetting.last
    some_settings.each do |k, v|
      if k.include('footer')
        panel 'Footer' do
          h3 v
        end
      end
    end
  end
end

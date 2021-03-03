class FooterServices
  def call
    sleep 5
    some_settings = AppSetting.last
    footer = {
      title: some_settings.footer_settings_title,
      background: some_settings.footer_settings_background,
      color: some_settings.footer_settings_color
    }
    return footer
  end
end

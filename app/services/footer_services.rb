class FooterServices
  def call
    sleep 5
    AppSetting.last
  end
end

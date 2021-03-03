# Module that generate a information in footer
module FooterServices
  def self.call
    sleep 5
    Footer.last
  end
end

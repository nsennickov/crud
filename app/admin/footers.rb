ActiveAdmin.register Footer do
  permit_params :title, :background, :color, updated_at: Time.now

  member_action :update do
    footer = Footer.find(params[:id])
    footer.update!(permitted_params[:footer])
    redirect_to admin_footers_path
  end
end

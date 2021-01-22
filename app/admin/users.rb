ActiveAdmin.register User do
  before_action :current_user

  permit_params :email, :password, :password_confirmation

  action_item :view, only: :show do
    link_to 'View on site', admin_user_path
  end

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  show title: :email do
    @items = User.find(params[:id]).items

    attributes_table do
      row :email
      row :reset_password_token
      row :reset_password_sent_at
      row :remember_created_at
      row :created_at
      row :updated_at
    end

    panel 'User items and subitems' do
      if @items.any?
        @items.each do |item|
          h3 item.todo, class: 'panel-item'
          item.subitems.each do |subitem|
            li subitem.title, class: 'panel-subitem'
          end
        end
      else
        h3 'User have not items', style: 'margin: 0'
      end
    end
    active_admin_comments
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  def current_user_admin?
    @user = User.find(params[:id]).admin?
  end

end

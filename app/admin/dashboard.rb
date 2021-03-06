ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do

    users_count = User.all.length
    items_count = Item.all.length

    columns do
      panel '' do
        h2 "#{users_count} people used our product!!"
      end

      panel '' do
        h2 "#{items_count} items created and displayed now!!"
      end
    end
  end
end

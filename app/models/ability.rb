class Ability
  include CanCan::Ability
  include Rails.application.routes.url_helpers
  # include Devise::Controllers::Helpers
  # helper_method current_user Если разкоментировать дабы юзать current_user райзит ошибку что
  # helper_method это undefined method

  def initialize(user)
    if user.admin?  # additional permissions for administrators
      can :manage, :all
    else
      root_path
    end
  end
end

module UsersHelper
    def current_user
        User.find_by(id: session[:user_id])
    end

    def admin?
        current_user.admin == true
    end
end

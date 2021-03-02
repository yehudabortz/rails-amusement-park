class UsersController < ApplicationController


  def new
    @user = User.new
  end


  def show
    # binding.pry
    @user = User.find_by(id: params[:id])
    return redirect_to root_url unless current_user == @user 
  end  
  
    # GET /users/new

  def create
    return redirect_to controller: 'users', action: 'new' unless user = User.create(user_params)
    if user.persisted?
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to user_path(user)
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.


    # Only allow a list of trusted parameters through.
    def user_params

      params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end
end

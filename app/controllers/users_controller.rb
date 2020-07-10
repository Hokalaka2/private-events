class UsersController < ApplicationController

    def new
        @user = User.new
    end
    def create
        @user = User.new(user_params)

        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user.id)
        else
            render new_users_path
        end
    end
    def show
        if session[:user_id]
            @user = User.includes(:attended).find(session[:user_id])
            @attendeds = @user.attended.order('eventdate')
            @check = 0
        else
            redirect_to '/login'
        end
    end
    def user_params
        params.require(:user).permit(:loginid, :name)
    end

end

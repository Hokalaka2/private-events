class SessionsController < ApplicationController
    def create
        @user = User.find_by_loginid(params[:loginid])

        if @user.present?
            session[:user_id] = @user.id
            redirect_to root_path
        
        else
            redirect_to '/login'
        end
    end
    def destroy
        session[:user_id] = nil
        redirect_to '/login'
    end
end

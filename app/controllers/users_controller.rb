class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def created
        @user = User.new(user_params)

        if @user.save
            session[:user_id] = user.id
            redirect_to '/'
        else
            flash[:alert] = user.errors.full_messages
            redirect_to '/registration'
    end

    protected user_params
        params.require(:user).permit(
            :first_name,
            :last_name,
            :email,
            :password,
            :password_confirmation
        )
    end
end

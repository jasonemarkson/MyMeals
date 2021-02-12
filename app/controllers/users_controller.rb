class UsersController < ApplicationController
    def index
        @users = User.all
    end
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:message] = "Signup invalid. Please enter in all of the fields."
            redirect_to new_user_path
        end
    end

    def show
        if logged_in? 
            @user = User.find(params[:id])
        else
            redirect_to '/'
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :username, :password)
    end


end

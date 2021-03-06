class UsersController < ApplicationController
    def show
       @user = User.find(params[:id]) 
    end
    
    def new 
        @user = User.new
    end
    
    def create
        @user = User.new(params[user_params])
        if @user.save
            flash[:success] = "Welcome aboard!"
            redirect_to @user
        else
            flash[:danger] = "Something went wrong."
            render 'new'
        end
    end
    
    
    
    private
        def user_params
           params.require(:user).permit(:name, :email, :password, :password_confirmation) 
        end
end

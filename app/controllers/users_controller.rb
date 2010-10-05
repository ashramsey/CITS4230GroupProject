class UsersController < ApplicationController
    def signup
        @user = User.new
        @title = "Sign Up"
    end

    def show
        @user = User.find(params[:id])
        @title = @user.name
    end
  
    def create
        @user = User.new(params[:user])
        if @user.save
            # Handle a successful save
            flash[:success] = "Welcome to the Sample App!"
            redirect_to @user
        else
            @title = "Sign Up"
            render 'signup'
        end
    end
end

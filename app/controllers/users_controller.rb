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
			@chatrooms = Chatroom.all
      @chatroom = Chatroom.new
        @user = User.new(params[:user])
        if @user.save
						sign_in @user
            # Handle a successful save
            flash[:success] = "Welcome to the Sample App!"
            redirect_to :controller => 'chatrooms', :action =>  'index'
        else
            @title = "Sign Up"
            render 'signup'
        end
    end
end

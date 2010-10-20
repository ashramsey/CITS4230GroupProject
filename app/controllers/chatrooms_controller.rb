class ChatroomsController < ApplicationController
  def index
		 #if(session[:user] == nil)
     #   flash[:error] = "You must be sign in to create a chat"
     #   render :controller => users, :action => signup_path
     #end
     @chatrooms	= Chatroom.find(:all)
		 @chatroom = Chatroom.new
  end

  def new
     @title	= "Chat Room"
     # Fail to create chat room is User is not signing in
     if(session[:user] == nil)
        flash[:error] = "You must be sign in to create a chat"
        redirect_to :action => "index" and return 
     end
     @chatroom 	= Chatroom.new
  end

  def show
     @chatroom 	= Chatroom.find(params[:id])
     @user = current_user
     @membership = Membership.new(:chatroom_id => @chatroom.id, :user_id => @user.id)
     @entries = @chatroom.entries
     @users = User.all(:joins => :entries, :select => "users.*, count(entries.id) as entries_count", :group => "users.id")
     @title	= @chatroom.name
  end

  def create
     @chatroom 	= Chatroom.new(params[:chatroom])
     #if successfully saved
     if @chatroom.save
            flash[:notice] = "Chatroom is successfully created."
	   				redirect_to @chatroom
     #if unsuccessful, go back to new page
     else
            render :action => "index"
     end
  end

  def join
     redirect_to :controller => "users" ,:action => "signup", :id => "new"
  end

  def update_view
    @entry = Entry.new(params[:entry])
    @entry.user_id = current_user

    if @entry.save
       render :partial => "entries/list", :object => @entry
    end
  end
end

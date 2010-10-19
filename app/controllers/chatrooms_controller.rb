class ChatroomsController < ApplicationController
  def index
     @chatroom	= Chatroom.find(:all)
  end

  def new
     @title	= "Chat Room"
     # Fail to create chat room is User is not signing in
     #if(session[:user] == nil)
     #   flash[:error] = "You must be sign in to create a chat"
     #   redirect_to :action => "index" and return 
     #end
     @chatroom 	= Chatroom.new
  end

  def show
     @chatroom 	= Chatroom.find(params[:id])
     @title	= @chatroom.name
  end

  def create
     @chatroom 	= Chatroom.new(params[:chatroom])
     #if succesfully saved
     if @chatroom.save
            flash[:notice] = "Chatroom is successfully created."
	    redirect_to :action => "index"
     #if unsuccessful, go back to new page
     else
            render :action => "new"
     end
  end

  def join
     redirect_to :controller => "users" ,:action => "signup", :id => "new"
  end

end

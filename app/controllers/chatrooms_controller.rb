class ChatroomsController < ApplicationController
  def index
		 if(current_user == nil)
        flash[:error] = "You must be signed in to create a chat"
        redirect_to :controller => 'users', :action => 'signup'
     end
     @chatrooms	= Chatroom.find(:all)
		 @chatroom = Chatroom.new
  end

  def show
     @chatroom 	= Chatroom.find(params[:id])
     @user = current_user
     @membership = Membership.find(:all, :conditions=>{:chatroom_id=>@chatroom.id, :user_id=>@user.id})
     if @membership.count==0
        @membership = Membership.create(:chatroom_id => @chatroom.id, :user_id => @user.id)
     end
     @entries = @chatroom.entries
     @users = User.all(:joins => :entries, :select => "users.*, count(entries.id) as entries_count", :group => "users.id")
     @title	= @chatroom.name
     @entry = Entry.new
  end

  def create

    respond_to do |format|
                format.html { redirect_to @chatroom }
                format.json { render :json => @entries.to_json, :callback => params[:callback] }
    end

    @chatroom 	= Chatroom.new(params[:chatroom])
     #if successfully saved
     if @chatroom.save
            flash[:notice] = "Chatroom is successfully created."

            respond_to do |format|
                format.html { redirect_to @chatroom }
                format.json { render :json => @entries.to_json, :callback => params[:callback] }
            end
     #if unsuccessful, go back to new page
     else
            render :action => "index"
     end
  end


  def update_view


    respond_to do |format|
      format.html
      #format.json {render :json => true}
      format.json { render :json => @entries.to_json, :callback => params[:callback] }
    end
    @entry = Entry.new(params[:entry])
    @entry.chatroom_id= params[:entry]['chatroom_id']
    @entry.user_id = current_user.id
    @chatroom 	= Chatroom.find(@entry.chatroom_id)
    @user = current_user
    @users = User.all(:joins => :entries, :select => "users.*, count(entries.id) as entries_count", :group => "users.id")
    if @entry.save
       @entries = Entry.find(:all, :conditions => ['user_id = ? AND chatroom_id = ?', current_user.id, @chatroom.id])
       if request.xhr?
        render @entry
       else
        flash[:notice] = "Comment added."
        redirect_to article_path(@comment.article)
      end
    else
      if request.xhr?
        render :status => 403
      else
        flash[:error] = "Comment could not be added."
        redirect_to @chatroom
        #redirect_to article_path(@comment.article)
      end
    end
  end

  #partial update to show new entries
  def relist
    @chatroom 	= Chatroom.find(params['chatroom_id'])
    @user = current_user
    @membership = Membership.find(:all, :conditions => {:chatroom_id => @chatroom.id, :user_id => @user.id })
    @users = User.all(:joins => :entries, :select => "users.*, count(entries.id) as entries_count", :group => "users.id")
    @entries = @chatroom.entries #Entry.find(:all, :conditions => ['user_id = ? AND chatroom_id = ?', current_user.id, @chatroom.id])
    @title	= @chatroom.name
    render :partial => "entries", :object => @entry
  end
end

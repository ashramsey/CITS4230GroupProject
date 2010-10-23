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
     @time = '2010-01-01 00:00:00'
     if params[:last_update]
       @time = params[:last_update]
     end
     logger.debug "LAST UPDATE #{@time}"
     if Membership.count == 0
        @membership = []
     else
        @membership = Membership.find(:all, :conditions=>{:chatroom_id=>@chatroom.id, :user_id=>@user.id})
     end
     @membership = Membership.create( :chatroom_id => @chatroom.id,
                                      :user_id => @user.id,
                                      :chatroom_name=>@chatroom.name,
                                      :user_name=>@user.name) if @membership.count==0
     @membership = Membership.find(:all, :conditions=>{:chatroom_id=>@chatroom.id})
    @entries = Entry.find(:all, :conditions=>['created_at > ? AND chatroom_id=?', @time.to_time, @chatroom.id])
    logger.debug "NUMBER OF ENTRIES #{@entries.count}"
    if @entries.count>0
      logger.debug "ENTRIES 0 #{@entries[0].message}"
    end
    @entry =Entry.new
     @title	= @chatroom.name
     respond_to do |format|
          format.html do # index.html.erb
            @d=0
            @e=02
          end
          format.js  do
              render :json => { :entries => @entries,
                :users => @chatroom.users }.to_json
          end
     end
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


  def update
    
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

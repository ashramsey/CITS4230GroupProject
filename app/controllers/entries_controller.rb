class EntriesController < ApplicationController
  
  # index page
  def index
    @entries = Entry.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @entries }
    end
  end
  
  #list entries page
  def list
    
  end

  #partial update to show new entries
  def relist
    render :partial => "message", :object => @entry
  end

  # show entiries page
  def show
    #@entry = Entry.find(params[:id])
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
    #respond_to do |format|
    #  format.html # show.html.erb
    #  format.xml  { render :xml => @entry }
    #end
  end

  def update_view
    @entry = Entry.new
  end
  # create new entry
  def new
    @entry = Entry.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @entry }
    end
  end

  # GET /entries/1/edit
  def edit
    @entry = Entry.find(params[:id])
  end


  # create new entry in databases
  def create
    @entry = Entry.new(params[:entry])
    @entry.chatroom_id= params[:entry]['chatroom_id']
    @entry.user_id = current_user.id
    @chatroom 	= Chatroom.find(@entry.chatroom_id)
    @entry.chatroom_name = @chatroom.name
    @user = current_user
    @entry.user_name = @user.name
    @users = User.all(:joins => :entries, :select => "users.*, count(entries.id) as entries_count", :group => "users.id")
    if @entry.save
       respond_to do |format|
          format.html do # index.html.erb
            @entries = @chatroom.entries #Entry.find(:all, :conditions => ['user_id = ? AND chatroom_id = ?', current_user.id, @chatroom.id])
            redirect_to @chatroom
          end
          format.js  do
          render :json => { :message => @entry.message,
                            :user_name => @user.name,
                            :created_at => @entry.created_at}.to_json

        end
       end
    else
      redirect_to :controller => 'chatrooms', :action => 'show'
    end
  end


  # update entries 
  def update
    @entry = Entry.find(params[:id])

    respond_to do |format|
      if @entry.update_attributes(params[:entry])
        format.html { redirect_to(@entry, :notice => 'Entry was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @entry.errors, :status => :unprocessable_entity }
      end
    end
  end


  # delete entries
  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to(entries_url) }
      format.xml  { head :ok }
    end
  end
  
  def comment
    @newentry = Entry.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @entry }
    end
  end
  
end #end of class

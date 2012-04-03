class FriendsController < ApplicationController
  # GET /friends
  # GET /friends.json
before_filter :login_required


  
  def index

    
    @friends = Friend.find_all_by_user_id(current_user.uid)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @friends }
    end
  end

  # GET /friends/1
  # GET /friends/1.json
   def show


    @credit=Credit.find_all_by_friend_id(params[:id])
    @friend = Friend.find_by_id_and_user_id(params[:id],current_user.uid) #bugfix login olan herkes herkesin arkadasini goremez
    respond_to do |format|
      format.html
      format.json { render :json => @friend }
    end
  end




  # GET /friends/new
  # GET /friends/new.json
  def new
    @friend = Friend.new(:user_id =>current_user.uid)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @friend }
    end
  end

  # GET /friends/1/edit
  def edit
    @friend = Friend.find_by_id_and_user_id(params[:id],current_user.uid)#bugfix login olan herkes herkesin arkadasini goremez
  end

  # POST /friends
  # POST /friends.json
  def create
    @friend = Friend.new(params[:friend])

    respond_to do |format|
      if @friend.save
        
        format.html { redirect_to @friend }
        format.json { render :json => @friend, :status => :created, :location => @friend }
      else
        format.html { render :action => "new" }
        format.json { render :json => @friend.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /friends/1
  # PUT /friends/1.json
  def update
    @friend = Friend.find(params[:id])

    respond_to do |format|
      if @friend.update_attributes(params[:friend])
        format.html { redirect_to @friend }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @friend.errors, :status => :unprocessable_entity }
      end
    end
  end

  def email
    @friend = Friend.find(params[:id])
    
    UserMailer.credit_confirmation(@friend).deliver
     respond_to do |format|
      format.html { redirect_to @friend}
      format.json { head :no_content }
    end
    
  end

  # DELETE /friends/1
  # DELETE /friends/1.json
  def destroy

    @credit = Credit.find_all_by_friend_id(params[:id])
    
    @friend = Friend.find(params[:id])

   @credit.each do |credit|
      credit.destroy
   end
    @friend.destroy
    

    respond_to do |format|
      format.html { redirect_to friends_url }
      format.json { head :no_content }
    end
  end
end

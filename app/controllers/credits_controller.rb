class CreditsController < ApplicationController
  # GET /credits
  # GET /credits.json
  #before_filter :login_required
  def index

    
    @credits = Credit.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @credits }
    end
  end

  # GET /credits/1
  # GET /credits/1.json
  def show
    #iptal edildi
    @credit = Credit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @credit }
    end
  end

  # GET /credits/new
  # GET /credits/new.json
  def new
    @credit = Credit.new(:friend_id => params[:friend_id] )
    @friend = Friend.find_by_id_and_user_id(@credit.friend_id,current_user.uid)#bug fix
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @credit }
    end
  end

  # GET /credits/1/edit
  def edit
    @credit = Credit.find(params[:id])
    @friend = Friend.find_by_id_and_user_id(@credit.friend_id,current_user.uid)#bug fix
  end

  # POST /credits
  # POST /credits.json
  def create
    @credit = Credit.new(params[:credit])
    @friend = Friend.find(@credit.friend_id)
    respond_to do |format|
      if @credit.save
        format.html { redirect_to @friend}
        format.json { render :json => @credit, :status => :created, :location => @credit }
      else
        format.html { render :action => "new" }
        format.json { render :json => @credit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /credits/1
  # PUT /credits/1.json
  def update
    @credit = Credit.find(params[:id])
    @friend = Friend.find(@credit.friend_id)
    respond_to do |format|
      if @credit.update_attributes(params[:credit])
        format.html { redirect_to @friend}
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @credit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /credits/1
  # DELETE /credits/1.json
  def destroy
    @credit = Credit.find(params[:id])
    @friend = Friend.find(@credit.friend_id)
    @credit.destroy

    respond_to do |format|
      format.html { redirect_to @friend }
      format.json { head :no_content }
    end
  end
end

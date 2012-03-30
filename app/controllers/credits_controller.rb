class CreditsController < ApplicationController
  # GET /credits
  # GET /credits.json
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
    @credit = Credit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @credit }
    end
  end

  # GET /credits/new
  # GET /credits/new.json
  def new
    @credit = Credit.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @credit }
    end
  end

  # GET /credits/1/edit
  def edit
    @credit = Credit.find(params[:id])
  end

  # POST /credits
  # POST /credits.json
  def create
    @credit = Credit.new(params[:credit])

    respond_to do |format|
      if @credit.save
        format.html { redirect_to @credit, :notice => 'Credit was successfully created.' }
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

    respond_to do |format|
      if @credit.update_attributes(params[:credit])
        format.html { redirect_to @credit, :notice => 'Credit was successfully updated.' }
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
    @credit.destroy

    respond_to do |format|
      format.html { redirect_to credits_url }
      format.json { head :no_content }
    end
  end
end

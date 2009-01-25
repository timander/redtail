class DressingsController < ApplicationController

  before_filter :admin?

  # GET /dressings
  # GET /dressings.xml
  def index
    @dressings = Dressing.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @dressings }
    end
  end

  # GET /dressings/1
  # GET /dressings/1.xml
  def show
    @dressing = Dressing.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dressing }
    end
  end

  # GET /dressings/new
  # GET /dressings/new.xml
  def new
    @dressing = Dressing.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dressing }
    end
  end

  # GET /dressings/1/edit
  def edit
    @dressing = Dressing.find(params[:id])
  end

  # POST /dressings
  # POST /dressings.xml
  def create
    @dressing = Dressing.new(params[:dressing])

    respond_to do |format|
      if @dressing.save
        flash[:notice] = 'Dressing was successfully created.'
        format.html { redirect_to(@dressing) }
        format.xml  { render :xml => @dressing, :status => :created, :location => @dressing }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @dressing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /dressings/1
  # PUT /dressings/1.xml
  def update
    @dressing = Dressing.find(params[:id])

    respond_to do |format|
      if @dressing.update_attributes(params[:dressing])
        flash[:notice] = 'Dressing was successfully updated.'
        format.html { redirect_to(@dressing) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dressing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /dressings/1
  # DELETE /dressings/1.xml
  def destroy
    @dressing = Dressing.find(params[:id])
    @dressing.destroy

    respond_to do |format|
      format.html { redirect_to(dressings_url) }
      format.xml  { head :ok }
    end
  end
end

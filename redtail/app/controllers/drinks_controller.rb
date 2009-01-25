class DrinksController < ApplicationController

  before_filter :admin?

  # GET /drinks
  # GET /drinks.xml
  def index
    @drinks = Drink.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @drinks }
    end
  end

  # GET /drinks/1
  # GET /drinks/1.xml
  def show
    @drink = Drink.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @drink }
    end
  end

  # GET /drinks/new
  # GET /drinks/new.xml
  def new
    @drink = Drink.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @drink }
    end
  end

  # GET /drinks/1/edit
  def edit
    @drink = Drink.find(params[:id])
  end

  # POST /drinks
  # POST /drinks.xml
  def create
    @drink = Drink.new(params[:drink])

    respond_to do |format|
      if @drink.save
        flash[:notice] = 'Drink was successfully created.'
        format.html { redirect_to(@drink) }
        format.xml  { render :xml => @drink, :status => :created, :location => @drink }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @drink.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /drinks/1
  # PUT /drinks/1.xml
  def update
    @drink = Drink.find(params[:id])

    respond_to do |format|
      if @drink.update_attributes(params[:drink])
        flash[:notice] = 'Drink was successfully updated.'
        format.html { redirect_to(@drink) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @drink.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /drinks/1
  # DELETE /drinks/1.xml
  def destroy
    @drink = Drink.find(params[:id])
    @drink.destroy

    respond_to do |format|
      format.html { redirect_to(drinks_url) }
      format.xml  { head :ok }
    end
  end
end

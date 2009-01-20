class LoginsController < ApplicationController
  # GET /logins
  # GET /logins.xml
  def index
    @logins = Login.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @logins }
    end
  end

  # GET /logins/1
  # GET /logins/1.xml
  def show
    @login = Login.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @login }
    end
  end

  # GET /logins/new
  # GET /logins/new.xml
  def new
    @login = Login.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @login }
    end
  end

  # GET /logins/1/edit
  def edit
    @login = Login.find(params[:id])
  end

  # POST /logins
  # POST /logins.xml
  def create
    @login = Login.new(params[:login])

    respond_to do |format|
      if @login.save
        flash[:notice] = 'Login was successfully created.'
        format.html { redirect_to(@login) }
        format.xml  { render :xml => @login, :status => :created, :location => @login }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @login.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /logins/1
  # PUT /logins/1.xml
  def update
    @login = Login.find(params[:id])

    respond_to do |format|
      if @login.update_attributes(params[:login])
        flash[:notice] = 'Login was successfully updated.'
        format.html { redirect_to(@login) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @login.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /logins/1
  # DELETE /logins/1.xml
  def destroy
    @login = Login.find(params[:id])
    @login.destroy

    respond_to do |format|
      format.html { redirect_to(logins_url) }
      format.xml  { head :ok }
    end
  end
end

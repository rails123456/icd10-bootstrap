class QandasController < ApplicationController
  # GET /qandas
  # GET /qandas.json
  def index
    if admin?
      @qandas = Qanda.unanswered.page(params[:page]).per(5).order("id DESC")
    elsif consultant?
      @qandas = Qanda.where(:qa_consultant => @current_user.id).unanswered
    elsif member?
      @qandas = Qanda.where(:user_id => @current_user.id).page(params[:page])
    else
      @qandas = Qanda.all.page(params[:page])
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @qandas }
    end
  end

  # GET /qandas/1
  # GET /qandas/1.json
  def show
    @qanda = Qanda.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @qanda }
    end
  end

  # GET /qandas/new
  # GET /qandas/new.json
  def new
    @qanda = Qanda.new
    if params[:specialty_id]
      @qanda.specialty_id = params[:specialty_id]
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @qanda }
    end
  end

  # GET /qandas/1/edit
  def edit
    @qanda = Qanda.find(params[:id])
  end

  # POST /qandas
  # POST /qandas.json
  def create
    @qanda = Qanda.new(params[:qanda])

    respond_to do |format|
      if @qanda.save
        format.html { redirect_to @qanda, :notice => 'Qanda was successfully created.' }
        format.json { render :json => @qanda, :status => :created, :location => @qanda }
      else
        format.html { render :action => "new" }
        format.json { render :json => @qanda.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /qandas/1
  # PUT /qandas/1.json
  def update
    @qanda = Qanda.find(params[:id])

    respond_to do |format|
      if @qanda.update_attributes(params[:qanda])
        format.html { redirect_to @qanda, :notice => 'Qanda was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @qanda.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /qandas/1
  # DELETE /qandas/1.json
  def destroy
    @qanda = Qanda.find(params[:id])
    @qanda.destroy

    respond_to do |format|
      format.html { redirect_to qandas_url }
      format.json { head :ok }
    end
  end
end

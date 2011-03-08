class VagasController < ApplicationController
  # GET /vagas
  # GET /vagas.xml
  def index
    @vagas = Vaga.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @vagas }
    end
  end

  # GET /vagas/1
  # GET /vagas/1.xml
  def show
    @vaga = Vaga.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @vaga }
    end
  end

  # GET /vagas/new
  # GET /vagas/new.xml
  def new
    @vaga = Vaga.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @vaga }
    end
  end

  # GET /vagas/1/edit
  def edit
    @vaga = Vaga.find(params[:id])
  end

  # POST /vagas
  # POST /vagas.xml
  def create
    @vaga = Vaga.new(params[:vaga])

    respond_to do |format|
      if @vaga.save
        format.html { redirect_to(@vaga, :notice => 'Vaga was successfully created.') }
        format.xml  { render :xml => @vaga, :status => :created, :location => @vaga }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @vaga.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /vagas/1
  # PUT /vagas/1.xml
  def update
    @vaga = Vaga.find(params[:id])

    respond_to do |format|
      if @vaga.update_attributes(params[:vaga])
        format.html { redirect_to(@vaga, :notice => 'Vaga was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @vaga.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /vagas/1
  # DELETE /vagas/1.xml
  def destroy
    @vaga = Vaga.find(params[:id])
    @vaga.destroy

    respond_to do |format|
      format.html { redirect_to(vagas_url) }
      format.xml  { head :ok }
    end
  end
end

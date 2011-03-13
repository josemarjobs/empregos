class VagasController < ApplicationController

	respond_to :html, :xml


  # GET /vagas
  # GET /vagas.xml
  def index
	if params[:perfil]
		p = Perfil.find(params[:perfil])
		@vagas = p.vagas.order("created_at").page(params[:page]).per(8)
	else	
	 	if params[:perfil_id] && params[:empresa_id]
			@vagas = Vaga.vagas(params[:perfil_id], params[:empresa_id]).order("created_at").page(params[:page]).per(8)
		else
			@vagas = Vaga.order("created_at").page(params[:page]).per(8)
		end
	end

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
	 @empresa = Empresa.new
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
	 tags = params[:tags].gsub(" ","").split(",")
    @vaga = Vaga.new(params[:vaga])

	 empresa = Empresa.find(session[:user_id])
	 empresa.nome_empresa = params[:empresa] if params[:empresa]
	 empresa.save
	 @vaga.empresa = empresa
    respond_to do |format|
      if @vaga.save
		 @vaga.create_tags(tags)
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
	empresa = Empresa.find(session[:user_id])
    respond_to do |format|
      format.html { redirect_to(empresa) }
      format.xml  { head :ok }
    end
	
  end
end

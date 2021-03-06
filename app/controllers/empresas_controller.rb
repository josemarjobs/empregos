class EmpresasController < ApplicationController
  # GET /empresas
  # GET /empresas.xml
	
	respond_to :html, :xml
	
	def meusdados
		@empresa = Empresa.find(session[:user_id])
		@vagas = @empresa.vagas.order("created_at DESC").page(params[:page]).per(12)

		respond_to do |format|
			format.html {render :show }
			format.xml  { render :xml => @empresas }
		end
	end

  def index
    @empresas = Empresa.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @empresas }
    end
  end

  # GET /empresas/1
  # GET /empresas/1.xml
  def show
	@empresa = Empresa.find(params[:id])
	#@vagas = @tag.vagas.order("created_at DESC").page(params[:page]).per(8)
	@vagas = @empresa.vagas.order("created_at DESC").page(params[:page]).per(10)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @empresa }
    end
  end

  # GET /empresas/new
  # GET /empresas/new.xml
  def new
    @empresa = Empresa.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @empresa }
    end
  end

  # GET /empresas/1/edit
  def edit
    @empresa = Empresa.find(params[:id])
  end

  # POST /empresas
  # POST /empresas.xml
  def create
    @empresa = Empresa.new(params[:empresa])
	
    respond_to do |format|
      if @empresa.save
			session[:user_id]=@empresa.id
        format.html { redirect_to(anunciar_url, :notice => 'Cadastrado com Sucesso') }
        format.xml  { render :xml => @empresa, :status => :created, :location => @empresa }
      else
        format.html { redirect_to anunciar_url, :notice=>"Preencha o formulário corretamente" }
        format.xml  { render :xml => @empresa.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /empresas/1
  # PUT /empresas/1.xml
  def update
    @empresa = Empresa.find(params[:id])

    respond_to do |format|
      if @empresa.update_attributes(params[:empresa])
        format.html { redirect_to(@empresa, :notice => 'Empresa was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @empresa.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /empresas/1
  # DELETE /empresas/1.xml
  def destroy
    @empresa = Empresa.find(params[:id])
    @empresa.destroy

    respond_to do |format|
      format.html { redirect_to(empresas_url) }
      format.xml  { head :ok }
    end
  end
end

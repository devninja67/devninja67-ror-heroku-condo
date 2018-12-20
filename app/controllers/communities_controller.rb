class CommunitiesController < ApplicationController
  
  before_action :set_community, except: [ :index, :new, :create ]

  #Validando permisos de comunidad por usuario. Excepto para index que es solo para site_admin y lo controlo con petergate
    before_action :validar_permiso_comunidad, except: [:index]


#Permisos gracias a Petergate
  access  administrador: {except: [:index, :new, :create, :destroy]},
          site_admin: :all

#Declarando el layout particular que usaremos
layout "1_column"

  # GET /communities
  def index
    @communities = Community.all.order("nombre ASC").includes(:administrador)
  end

  # GET /communities/1
  def show
    if logged_in?(:site_admin)
      render template: 'communities/show', layout: '1_column'
    elsif logged_in?(:administrador)
      render template: 'communities/show', layout: 'dashboard'
    end
  end

  # GET /communities/new
  def new
    @community = Community.new
    render template: 'communities/new', layout: '1_column'
  end

  # GET /communities/1/edit
  def edit
    if logged_in?(:site_admin)
      render template: 'communities/edit', layout: '1_column'
    elsif logged_in?(:administrador)
      render template: 'communities/edit', layout: 'dashboard'
    end
  end

  # POST /communities
  def create
    @community = Community.new(community_params)

    if @community.save
      crear_categorias_basicas
      crear_formas_de_cobro_basicas
      redirect_to @community, notice: 'Comunidad creada exitosamente.'
    else
      render :new
    end
  end

  # PATCH/PUT /communities/1
  def update
    if @community.update(community_params)
      if logged_in?(:site_admin)
        redirect_to communities_path, notice: 'Comunidad actualizada exitosamente.'
      elsif logged_in?(:administrador)
        redirect_to community_coownership_units_path(@community), notice: 'Comunidad actualizada exitosamente.'
      end
    else
      render :edit
    end
  end

  # DELETE /communities/1
  def destroy
    @community.destroy
    redirect_to communities_url, notice: 'Comunidad eliminada exitosamente.'
  end

  private
        # Only allow a trusted parameter "white list" through.
    def community_params
      if logged_in?(:site_admin)
        params.require(:community).permit(:administrador_id, :nombre, :ciudad, :comuna, :region, :pais, :direccion, :telefono1, :telefono2, :imagen, :logo, :rut, :fecha_constitution, :email)
      elsif logged_in?(:administrador)
        params.require(:community).permit(:nombre, :ciudad, :comuna, :region, :pais, :direccion, :telefono1, :telefono2, :imagen, :logo, :rut, :fecha_constitution, :email)  
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_community
      @community = Community.find(params[:id])
    end

    def validar_permiso_comunidad
      unless logged_in?(:site_admin)
        #Para el caso del administrador: 
        unless Community.where(["administrador_id = ?", "#{current_user.id}"]).where(id: @community).exists?
          redirect_to root_path, notice: 'No estás autorizado para administrar esta comunidad.'
        end
      end
    end

    def crear_categorias_basicas
      @categoria1 = @community.category_of_expenses.create(nombre: "Servicios")
      @categoria1.save
      conceptos_servicios = [ "Agua", "Cartero", "Combustible", "Electricidad", "Gas", "Internet",   "Teléfono", "TV cable"]
      conceptos_servicios.each do |nombre|
        concepto = @community.sub_category_of_expenses.create(category_of_expense_id: @categoria1.id, nombre: nombre)
        concepto.save
      end  

      @categoria2 = @community.category_of_expenses.create(nombre: "Proveedores")
      @categoria2.save
      conceptos_proveedores = ["Artículos de aseo", "Artículos de ferretería", "Artículos de jardinería", "Artículos de librería", "Servicios fumigación", "Artículos eléctricos", "Otros", "Reparaciones", "Servicio de administración", "Servicios de aseo", "Servicios de transporte", "Vestimenta de personal"]
      conceptos_proveedores.each do |nombre|
        concepto = @community.sub_category_of_expenses.create(category_of_expense_id: @categoria2.id, nombre: nombre)
        concepto.save
      end  


      @categoria3 = @community.category_of_expenses.create(nombre: "Gastos administrativos")
      @categoria3.save
      conceptos_gastos_administrativos = ["Asesorías profesionales", "Auditorías", "Caja chica", "Finiquito trabajador", "Reemplazos personal",]
      conceptos_gastos_administrativos.each do |nombre|
        concepto = @community.sub_category_of_expenses.create(category_of_expense_id: @categoria3.id, nombre: nombre)
        concepto.save
      end  

      @categoria4 = @community.category_of_expenses.create(nombre: "Seguros")
      @categoria4.save
      conceptos_seguros = ["Seguros generales"]
      conceptos_seguros.each do |nombre|
        concepto = @community.sub_category_of_expenses.create(category_of_expense_id: @categoria4.id, nombre: nombre)
        concepto.save
      end  

      @categoria5 = @community.category_of_expenses.create(nombre: "Mantenciones")
      @categoria5.save
      conceptos_mantenciones = ["Mantención ascensores", "Mantención sala de bombas", "Mantención piscina", "Mantención jardines", "Mantención generadores", "Mantención portones", "Mantención fachada"]
      conceptos_mantenciones.each do |nombre|
        concepto = @community.sub_category_of_expenses.create(category_of_expense_id: @categoria5.id, nombre: nombre)
        concepto.save
      end  

    end

  def crear_formas_de_cobro_basicas
      formas = ["Fondo de reserva", "Gasto común", "Cobro en alícuotas"]
      formas.each do |forma|
        forma_de_cobro = @community.payment_methods.create(nombre: forma)
        forma_de_cobro.save
      end  
      
  end

          

end

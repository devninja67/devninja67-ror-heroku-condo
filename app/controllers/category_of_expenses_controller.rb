class CategoryOfExpensesController < ApplicationController
  before_action :set_community
      #VERIFICAR QUE validar_permiso_comunidad SE APLICA A TODAS LAS ACCIONES NECESARIAS
  include ValidarPermisoComunidadConcern

  before_action :set_category_of_expense, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  #Declarando el layout particular que usaremos
  layout "dashboard"


  # GET /category_of_expenses
  def index
    @category_of_expenses = @community.category_of_expenses.all
  end

  # GET /category_of_expenses/1
  def show
  end

  # GET /category_of_expenses/new
  def new
    @category_of_expense = CategoryOfExpense.new
  end

  # GET /category_of_expenses/1/edit
  def edit
  end

  # POST /category_of_expenses
  def create
    @category_of_expense = @community.category_of_expenses.create(category_of_expense_params)
    @category_of_expense.save
    if @category_of_expense.save
      redirect_to community_category_of_expenses_path(@community), notice: 'Categoría de gasto creada exitosamente.'
    else
      render :new
    end
  end

  # PATCH/PUT /category_of_expenses/1
  def update
    if @category_of_expense.update(category_of_expense_params)
      redirect_to community_category_of_expenses_path(@community), notice: 'Categoría de gasto actualizada.'
    else
      render :edit
    end
  end

  # DELETE /category_of_expenses/1
  def destroy
    @category_of_expense.destroy
    redirect_to community_category_of_expenses_path(@community), notice: 'Categoría de gasto eliminada.'
  end

  private
    
    def set_community
      @community = Community.find(params[:community_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_category_of_expense
      #@category_of_expense = CategoryOfExpense.find(params[:id])
      @category_of_expense = @community.category_of_expenses.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def category_of_expense_params
      params.require(:category_of_expense).permit(:nombre)
    end
end

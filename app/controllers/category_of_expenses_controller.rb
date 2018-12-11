class CategoryOfExpensesController < ApplicationController
  before_action :set_category_of_expense, only: [:show, :edit, :update, :destroy]

  # GET /category_of_expenses
  # GET /category_of_expenses.json
  def index
    @category_of_expenses = CategoryOfExpense.all
  end

  # GET /category_of_expenses/1
  # GET /category_of_expenses/1.json
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
  # POST /category_of_expenses.json
  def create
    @category_of_expense = CategoryOfExpense.new(category_of_expense_params)

    respond_to do |format|
      if @category_of_expense.save
        format.html { redirect_to @category_of_expense, notice: 'Category of expense was successfully created.' }
        format.json { render :show, status: :created, location: @category_of_expense }
      else
        format.html { render :new }
        format.json { render json: @category_of_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /category_of_expenses/1
  # PATCH/PUT /category_of_expenses/1.json
  def update
    respond_to do |format|
      if @category_of_expense.update(category_of_expense_params)
        format.html { redirect_to @category_of_expense, notice: 'Category of expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @category_of_expense }
      else
        format.html { render :edit }
        format.json { render json: @category_of_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /category_of_expenses/1
  # DELETE /category_of_expenses/1.json
  def destroy
    @category_of_expense.destroy
    respond_to do |format|
      format.html { redirect_to category_of_expenses_url, notice: 'Category of expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category_of_expense
      @category_of_expense = CategoryOfExpense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_of_expense_params
      params.fetch(:category_of_expense, {})
    end
end

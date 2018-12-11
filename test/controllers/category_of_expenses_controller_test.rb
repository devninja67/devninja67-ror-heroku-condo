require 'test_helper'

class CategoryOfExpensesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category_of_expense = category_of_expenses(:one)
  end

  test "should get index" do
    get category_of_expenses_url
    assert_response :success
  end

  test "should get new" do
    get new_category_of_expense_url
    assert_response :success
  end

  test "should create category_of_expense" do
    assert_difference('CategoryOfExpense.count') do
      post category_of_expenses_url, params: { category_of_expense: {  } }
    end

    assert_redirected_to category_of_expense_url(CategoryOfExpense.last)
  end

  test "should show category_of_expense" do
    get category_of_expense_url(@category_of_expense)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_of_expense_url(@category_of_expense)
    assert_response :success
  end

  test "should update category_of_expense" do
    patch category_of_expense_url(@category_of_expense), params: { category_of_expense: {  } }
    assert_redirected_to category_of_expense_url(@category_of_expense)
  end

  test "should destroy category_of_expense" do
    assert_difference('CategoryOfExpense.count', -1) do
      delete category_of_expense_url(@category_of_expense)
    end

    assert_redirected_to category_of_expenses_url
  end
end

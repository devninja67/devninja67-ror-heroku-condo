require "application_system_test_case"

class CategoryOfExpensesTest < ApplicationSystemTestCase
  setup do
    @category_of_expense = category_of_expenses(:one)
  end

  test "visiting the index" do
    visit category_of_expenses_url
    assert_selector "h1", text: "Category Of Expenses"
  end

  test "creating a Category of expense" do
    visit category_of_expenses_url
    click_on "New Category Of Expense"

    click_on "Create Category of expense"

    assert_text "Category of expense was successfully created"
    click_on "Back"
  end

  test "updating a Category of expense" do
    visit category_of_expenses_url
    click_on "Edit", match: :first

    click_on "Update Category of expense"

    assert_text "Category of expense was successfully updated"
    click_on "Back"
  end

  test "destroying a Category of expense" do
    visit category_of_expenses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Category of expense was successfully destroyed"
  end
end

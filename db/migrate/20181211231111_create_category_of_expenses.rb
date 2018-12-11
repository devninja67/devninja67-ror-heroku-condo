class CreateCategoryOfExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :category_of_expenses do |t|
      t.references :community, foreign_key: true
      t.string :nombre

      t.timestamps
    end
  end
end

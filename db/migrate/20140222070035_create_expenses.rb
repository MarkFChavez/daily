class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.decimal :amount
      t.text :description
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end

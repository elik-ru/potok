# frozen_string_literal: true

class CreateLoans < ActiveRecord::Migration[5.1]
  def change
    create_table :loans do |t|
      t.float :amount, null: false, default: 0

      t.timestamps
    end
  end
end

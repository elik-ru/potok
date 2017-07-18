# frozen_string_literal: true

class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.references :loan, foreign_key: true
      t.integer :month, null: false, default: 0
      t.float :amount, null: false, default: 0

      t.timestamps
    end
  end
end

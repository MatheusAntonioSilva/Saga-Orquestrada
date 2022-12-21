class CreateAccount < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :name, null: false
      t.string :phone, null: false
      t.bigint :order_id, null: false

      t.timestamps
    end
  end
end

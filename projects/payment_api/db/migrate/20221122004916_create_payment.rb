class CreatePayment < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.string :flag
      t.string :card_reference
      t.string :split
      t.bigint :order_id, null: false

      t.timestamps
    end
  end
end

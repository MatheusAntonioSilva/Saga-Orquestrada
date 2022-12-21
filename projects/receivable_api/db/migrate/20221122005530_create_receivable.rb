class CreateReceivable < ActiveRecord::Migration[7.0]
  def change
    create_table :receivables do |t|
      t.string :description
      t.bigint :order_id, null: false

      t.timestamps
    end
  end
end

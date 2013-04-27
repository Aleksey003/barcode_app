class CreateBarcodes < ActiveRecord::Migration
  def change
    create_table :barcodes do |t|
      t.string :data
      t.references :user

      t.timestamps
    end
    add_index :barcodes, :user_id
  end
end

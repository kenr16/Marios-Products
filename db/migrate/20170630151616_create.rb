class Create < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.column :name, :string
      t.column :country, :string
      t.column :picture, :string
      t.column :description, :string
      t.column :price, :decimal

      t.timestamps
    end
  end
end

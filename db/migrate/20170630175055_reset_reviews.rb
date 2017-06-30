class ResetReviews < ActiveRecord::Migration[5.1]
  def change
    drop_table :reviews

    create_table :reviews do |t|
      t.column :author, :string
      t.column :rating, :integer
      t.column :content, :string
      t.column :product_id, :integer

      t.timestamps
    end

  end
end

class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :user_id
      t.string  :status, default: "not submitted"
      t.timestamps null: false
    end
  end
end

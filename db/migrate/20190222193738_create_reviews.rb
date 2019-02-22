class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :description
      t.integer :rating
      t.reference :product
      t.reference :user

      t.timestamps null: false
    end
  end
end

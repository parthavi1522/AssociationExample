class CreateCategorizations < ActiveRecord::Migration[7.1]
  def change
    create_table :categorizations do |t|
      t.references :category, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end

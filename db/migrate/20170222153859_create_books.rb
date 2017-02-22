class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.references :category
      t.string :isbn, index: {unique: true}
      t.string :title, index: true
      t.string :name, index: true
      t.string :author, index: true
      t.datetime :release_date, index: true
      t.string :type
      t.timestamps
    end
  end
end

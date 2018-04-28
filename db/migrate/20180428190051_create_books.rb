class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books, id: :uuid do |t|
      t.string :title, null: false, index: { unique: true }
      t.decimal :price, precision: 8, scale: 2, null: false, index: true
      t.date :release, null: false, index: true
      t.belongs_to :format, null: false, index: true, type: :uuid,forigin_key: { to_table: :formats }
      t.timestamps
    end
  end
end

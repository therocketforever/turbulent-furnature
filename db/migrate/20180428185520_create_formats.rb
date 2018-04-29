class CreateFormats < ActiveRecord::Migration[5.1]
  def change
    create_table :formats, id: :uuid do |t|
      t.integer :name, null: false, default: 0, index: { unique: true }
      t.timestamps null: false
    end
  end
end

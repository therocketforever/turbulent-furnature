class CreateAuthorships < ActiveRecord::Migration[5.1]
  def change
    create_table :authorships, id: :uuid do |t|
      t.belongs_to :author, type: :uuid, null: false, index: true, forigen_key: { to_table: :authors }
      t.belongs_to :book, type: :uuid, null: false, index: true, forigen_key: { to_table: :books }
      t.timestamps null: false
    end
  end
end

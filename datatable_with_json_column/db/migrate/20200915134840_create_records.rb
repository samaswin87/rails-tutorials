class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.jsonb :dynamic_fields, null: false
      t.timestamps
    end

    add_index  :records, :dynamic_fields, using: :gin
  end
end

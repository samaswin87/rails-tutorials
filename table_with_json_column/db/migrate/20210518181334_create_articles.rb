class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :name
      t.text :custom_fields

      t.timestamps
    end
  end
end

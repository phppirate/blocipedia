class CreateWikis < ActiveRecord::Migration
  def change
    create_table :wikis do |t|
      t.string :name
      t.boolean :private
      t.string :slug
      t.text :description
      t.text :body

      t.timestamps
    end
  end
end

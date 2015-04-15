class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :subtitle
      t.text :description
      t.text :short_description
      t.integer :order_display
      t.references :experience, index: true

      t.timestamps
    end
  end
end

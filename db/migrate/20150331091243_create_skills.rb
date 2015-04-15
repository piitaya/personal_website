class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name
      t.integer :power
      t.references :category, index: true

      t.timestamps
    end
  end
end

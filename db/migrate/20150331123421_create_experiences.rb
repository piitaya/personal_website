class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :title
      t.string :place
      t.string :country
      t.string :company
      t.attachment :logo
      t.attachment :image
      t.date :begin_date
      t.date :end_date
      t.text :description
      t.text :short_description
      t.references :type, index: true

      t.timestamps
    end
  end
end

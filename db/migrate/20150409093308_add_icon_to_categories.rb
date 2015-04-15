class AddIconToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :style_icon, :string
  end
end

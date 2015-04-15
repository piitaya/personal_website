class AddIconToTypes < ActiveRecord::Migration
  def change
    add_column :types, :style_icon, :string
  end
end

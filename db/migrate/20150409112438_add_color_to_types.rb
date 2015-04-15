class AddColorToTypes < ActiveRecord::Migration
  def change
    add_column :types, :style_color, :string
  end
end

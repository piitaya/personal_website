class CreateExperienceTranslations < ActiveRecord::Migration
  def self.up
    Experience.create_translation_table!({
      :title => :string,
      :place => :string,
      :country => :string,
      :company => :string,
      :description => :text,
      :short_description => :text     
    }, {
      :migrate_data => true
    })
  end

  def self.down
    Experience.drop_translation_table! :migrate_data => true
  end
end
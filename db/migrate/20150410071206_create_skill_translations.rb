class CreateSkillTranslations < ActiveRecord::Migration
  def self.up
    Skill.create_translation_table!({
      :name => :string
    }, {
      :migrate_data => true
    })
  end

  def self.down
    Skill.drop_translation_table! :migrate_data => true
  end
end
class CreateExperiencesSkills < ActiveRecord::Migration
	def self.up
		create_table :experiences_skills, :id => false do |t|
			t.integer :experience_id
			t.integer :skill_id
		end
	end

	def self.down
		drop_table :experiences_skills
	end
end
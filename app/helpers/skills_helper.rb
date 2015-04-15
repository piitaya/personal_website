module SkillsHelper
	def style(skill)
		if skill.nil?
			return ''
		end
		if skill.power <= 2
			return "progress-bar-material-red"
		elsif skill.power <= 5
			return "progress-bar-material-orange"
		else
			return "progress-bar-material-green"
		end
	end
end

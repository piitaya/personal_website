module ExperiencesHelper

	def place(experience)
		experience.company.to_s + t("support.array.words_connector") + experience.place.to_s + t("support.array.words_connector") + experience.country.to_s
	end
  
	def period_date(experience)	
		# Date initialization
		begin_date = experience.begin_date
		if experience.end_date.nil?
			end_date = DateTime.now
		else
			end_date = experience.end_date
		end
    
		# Period calcul
		months = (end_date.year - begin_date.year) * 12 + end_date.month - begin_date.month + 1
		period = ""
		if months >= 12
			period += t("datetime.distance_in_words.x_years", count: months/12)
			if months.modulo(12) != 0
				period += t("support.array.two_words_connector")
			end
		end
		if months.modulo(12) != 0
      period += t("datetime.distance_in_words.x_months", count: months.modulo(12))
		end
		return period
	end

	def date(experience)
		formated_date = "#{l(experience.begin_date, format: :monthyear)} - "
		if experience.end_date.nil?
			formated_date += "#{t("date.today")}"
		else 
			formated_date += "#{l(experience.end_date, format: :monthyear)}"
		end
		return formated_date + " (#{period_date(experience)})"
	end

  # return class for experience button
	def style_button(experience, element)
		if experience.type.nil?
			return style_color(experience, element)
    else
      return style_color(experience, element) + " " + experience.type.style_icon
		end
    
    
	end

  #return class for color element
  def style_color(experience, element)
    if experience.type.nil?
			return element_color(element, "material-grey")
    else
      return element_color(element, experience.type.style_color)
		end   
  end
end

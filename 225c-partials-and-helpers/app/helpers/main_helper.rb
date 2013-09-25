module MainHelper
	def multiply
    "&times;".html_safe
	end

	def divide
		"&divide;".html_safe
	end

  def logo_image
    "logo.png"
  end

	def blue_submit
		"<div class='form-group'>
  		#{submit_tag "Submit", class: "btn btn-primary btn-lg btn-block"}
    </div>".html_safe
	end

	def icon_button(icon_name)
		"<button class='btn btn-default'>
  		<span class='glyphicon glyphicon-volume-#{icon_name}'></span>
		</button>".html_safe
	end

	def full_name(user)
		"#{user.first_name} #{user.last_name}"
	end

	def format_date(date)
		date.strftime('%Y-%m-%d')
	end

	def navbar_tab(tab_name)

  end

	def red_if_too_young(age)
		if age >= 21
 			age
		else
			"<span class='under-21'>#{age}</span>"
    end
  end 

end

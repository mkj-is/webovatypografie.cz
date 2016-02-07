module AppHelper

	def abbr(name, description)
		("<span class=\"term\" title=\"" + description + "\">" + name + "</span>").html_safe
	end

end

module ArticlesHelper
	# Returns Bootstrap badge class for a given status
	# public => green, private => red, archived => blue
	def status_badge_class(status)
		case status.to_s
		when "public"
			"bg-success"
		when "private"
			"bg-danger"
		when "archived"
			"bg-primary"
		else
			"bg-secondary"
		end
	end
end

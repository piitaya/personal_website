class ErrorsController < ApplicationController
	def error404
		@title = t("title.error404")
		@subtitle = t("subtitle.error404")
		render status: :not_found
	end
end
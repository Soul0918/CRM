class GalaxyMacausController < ApplicationController
	def index
		# @galaxy_macaus = GalaxyMacau.all
		@galaxy_macaus = GalaxyMacau.page params[:page]
		@search = GalaxyMacau.ransack(params[:q])
		@galaxy_macaus = @search.result
	end
end

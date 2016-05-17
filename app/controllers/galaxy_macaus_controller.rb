class GalaxyMacausController < ApplicationController
	def index
		@galaxy_macaus = GalaxyMacau.all
	end
end

class DazhongsController < ApplicationController
	def index
		@dazhongs = Dazhong.all
	end
end

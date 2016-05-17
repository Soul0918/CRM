class DazhongsController < ApplicationController
	def index
		# @dazhongs = Dazhong.all
		@dazhongs = Dazhong.page params[:page]
		@search = Dazhong.ransack(params[:q])
		@dazhongs = @search.result
	end
end

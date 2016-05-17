class LogsController < ApplicationController
	load_and_authorize_resource
	def index
		# @logs = Log.page params[:page]
		@search = Log.ransack(params[:q])
    @logs = @search.result
	end
end

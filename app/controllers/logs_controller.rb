class LogsController < ApplicationController
	load_and_authorize_resource
	def index
		@logs = Log.page params[:page]
	end
end

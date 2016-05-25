class LogsController < ApplicationController
	load_and_authorize_resource
	# def index
	# 	# @logs = Log.page params[:page]
	# 	q_param = params[:q]
	# 	page = params[:page]
	# 	per_page = params[:per_page]
	#
	# 	@search = Log.ransack(params[:q])
  #   @logs = @search.result.page(page).per(per_page)
	#
	# end
	def index
		@logs = Log.page params[:page]
		q_param = params[:p]
		page = params[:page]
		per_page = params[:per_page]

		@search = Log.ransack(params[:q])
    @logs = @search.result.page(page).per(per_page)
		respond_to do |format|
			format.html
			format.csv { send_data @logs.to_csv }
			format.xls # { send_data @products.to_csv(col_sep: "\t") }
		end
	end

	def import
		Log.import(params[:file])
		redirect_to logs_url, notice: "logs imported."
	end
end

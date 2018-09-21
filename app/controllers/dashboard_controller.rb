class DashboardController < ApplicationController
	layout false
	before_action :authenticate_user!

	def index
	end
end

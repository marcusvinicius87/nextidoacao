class PagesController < ApplicationController
	def show
    	if params[:page] == "teste"
    		render template: "pages/#{params[:page]}", :layout => false
    	else
    		render template: "pages/#{params[:page]}"
    	end
  	end
end

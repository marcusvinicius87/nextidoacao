class PagesController < ApplicationController
	def show
    	if params[:page] == "teste"
    		if not user_signed_in?
    			redirect_to root_path
    		else
    			render template: "pages/#{params[:page]}", :layout => false
    		end
    	else
    		render template: "pages/#{params[:page]}"
    	end
  	end
end

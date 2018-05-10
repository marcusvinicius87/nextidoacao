class SessionsController < Devise::SessionsController

	before_action :require_activated, only: [:create]

	def new
		super
	end

	def create
		super
	end

	def destroy
		signed_in = signed_in?(resource_name)
		sign_out(resource_name)
		redirect_to user_not_actived_path
	end

	private

	def require_activated
		if user_signed_in?
			if current_user.activate_for_authentication?
				set_flash_message :notice, :ativo
			else
				destroy
				set_flash_message :notice, :not_ativo
			end
		end
	end

end
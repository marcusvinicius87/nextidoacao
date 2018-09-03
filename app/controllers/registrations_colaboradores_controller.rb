class RegistrationsColaboradoresController < Devise::RegistrationsController

	before_action :is_admin, only: [:new, :create]
	prepend_before_action :require_no_authentication, only: :cancel

	def new
		super
	end

	def create
		super
	end

	def is_admin
		if current_user != nil
			if (current_user.tipo_usuario != "administrador")
				redirect_to root_path
			end
		else
			redirect_to root_path
		end
	end
end

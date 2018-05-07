class RegistrationsController < Devise::RegistrationsController

	before_action :require_token_find

	def new
		super
	end

	def create
		@instituicao = Instituicao.find_token_instituicao(params[:token])
		
		@user.instituicao_id = @instituicao.id
		
		super
	end

	def require_token_find
		unless Instituicao.find_token_instituicao(params[:token]) != nil
			redirect_to root_path
		end
	end

	def update
		super
	end

	private 

	def user_params
		params.require(:user).permit(:login, :email, :password, :password_confirmation, :instituicao_id)
	end
end
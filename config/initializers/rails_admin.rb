RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
   warden.authenticate! scope: :usuario_nexti
 end
  # config.current_user_method(:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.model 'Instituicao' do
    label "Instituição" 
    label_plural "Instituições"
  end

  config.model 'Instituicao' do
    list do
      field :nome_instituicao
      field :nome_relatorio_instituicao
      field :codigo_instituicao
      field :cnpj
      field :codigo_produto
    end
  end

  config.excluded_models = ["Telefone", "Endereco", "UsuarioNexti"]
  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end

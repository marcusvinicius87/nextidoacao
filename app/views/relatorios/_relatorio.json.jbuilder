json.extract! relatorio, :id, :data_inicio, :data_final, :nome_arquivo, :user_id, :instituicao_id, :created_at, :updated_at
json.url relatorio_url(relatorio, format: :json)

json.extract! endereco, :id, :logradouro, :tipo_logradouro, :numero, :bairro, :cidade, :estado, :created_at, :updated_at
json.url endereco_url(endereco, format: :json)

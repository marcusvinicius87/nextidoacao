# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

usuario_nexti = UsuarioNexti.create!(email: ENV['ADMIN_TEST_USER'], password: ENV['ADMIN_TEST_PASSWORD'], password_confirmation: ENV['ADMIN_TEST_PASSWORD'], login: ENV['ADMIN_LOGIN'])
instituicao_teste = Instituicao.create!(nome_instituicao: 'TESTE', nome_relatorio_instituicao: 'RELATORIO_TESTE', codigo_instituicao: "11", codigo_produto: "12", cnpj: '1111111111', email: 'teste@teste.com', nome_arquivo: "TESTE")
usuario_teste = User.create!(email: "teste@teste.com", login: "teste", password: '123456', password_confirmation: '123456', instituicao_id: instituicao_teste.id, ativo: false)
require 'test_helper'

class InstituicaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @instituicao = instituicaos(:one)
  end

  test "should get index" do
    get instituicaos_url
    assert_response :success
  end

  test "should get new" do
    get new_instituicao_url
    assert_response :success
  end

  test "should create instituicao" do
    assert_difference('Instituicao.count') do
      post instituicaos_url, params: { instituicao: { cnpj: @instituicao.cnpj, codigo_instituicao: @instituicao.codigo_instituicao, codigo_produto: @instituicao.codigo_produto, logo: @instituicao.logo, nome_instituicao: @instituicao.nome_instituicao, nome_relatorio_instituicao: @instituicao.nome_relatorio_instituicao } }
    end

    assert_redirected_to instituicao_url(Instituicao.last)
  end

  test "should show instituicao" do
    get instituicao_url(@instituicao)
    assert_response :success
  end

  test "should get edit" do
    get edit_instituicao_url(@instituicao)
    assert_response :success
  end

  test "should update instituicao" do
    patch instituicao_url(@instituicao), params: { instituicao: { cnpj: @instituicao.cnpj, codigo_instituicao: @instituicao.codigo_instituicao, codigo_produto: @instituicao.codigo_produto, logo: @instituicao.logo, nome_instituicao: @instituicao.nome_instituicao, nome_relatorio_instituicao: @instituicao.nome_relatorio_instituicao } }
    assert_redirected_to instituicao_url(@instituicao)
  end

  test "should destroy instituicao" do
    assert_difference('Instituicao.count', -1) do
      delete instituicao_url(@instituicao)
    end

    assert_redirected_to instituicaos_url
  end
end

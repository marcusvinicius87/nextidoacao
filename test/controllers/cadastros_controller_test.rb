require 'test_helper'

class CadastrosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cadastro = cadastros(:one)
  end

  test "should get index" do
    get cadastros_url
    assert_response :success
  end

  test "should get new" do
    get new_cadastro_url
    assert_response :success
  end

  test "should create cadastro" do
    assert_difference('Cadastro.count') do
      post cadastros_url, params: { cadastro: { codigo_ocorrencia: @cadastro.codigo_ocorrencia, data_ocorrencia: @cadastro.data_ocorrencia, digito_verificador_cliente_enel: @cadastro.digito_verificador_cliente_enel, doador_ativo: @cadastro.doador_ativo, doador_ativo: @cadastro.doador_ativo, id_cliente_enel: @cadastro.id_cliente_enel, livre: @cadastro.livre, parcelas: @cadastro.parcelas, parcelas_controle: @cadastro.parcelas_controle, valor: @cadastro.valor } }
    end

    assert_redirected_to cadastro_url(Cadastro.last)
  end

  test "should show cadastro" do
    get cadastro_url(@cadastro)
    assert_response :success
  end

  test "should get edit" do
    get edit_cadastro_url(@cadastro)
    assert_response :success
  end

  test "should update cadastro" do
    patch cadastro_url(@cadastro), params: { cadastro: { codigo_ocorrencia: @cadastro.codigo_ocorrencia, data_ocorrencia: @cadastro.data_ocorrencia, digito_verificador_cliente_enel: @cadastro.digito_verificador_cliente_enel, doador_ativo: @cadastro.doador_ativo, doador_ativo: @cadastro.doador_ativo, id_cliente_enel: @cadastro.id_cliente_enel, livre: @cadastro.livre, parcelas: @cadastro.parcelas, parcelas_controle: @cadastro.parcelas_controle, valor: @cadastro.valor } }
    assert_redirected_to cadastro_url(@cadastro)
  end

  test "should destroy cadastro" do
    assert_difference('Cadastro.count', -1) do
      delete cadastro_url(@cadastro)
    end

    assert_redirected_to cadastros_url
  end
end

require 'test_helper'

class CaminoAsociadosControllerTest < ActionController::TestCase
  setup do
    @camino_asociado = camino_asociados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:camino_asociados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create camino_asociado" do
    assert_difference('CaminoAsociado.count') do
      post :create, camino_asociado: @camino_asociado.attributes
    end

    assert_redirected_to camino_asociado_path(assigns(:camino_asociado))
  end

  test "should show camino_asociado" do
    get :show, id: @camino_asociado.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @camino_asociado.to_param
    assert_response :success
  end

  test "should update camino_asociado" do
    put :update, id: @camino_asociado.to_param, camino_asociado: @camino_asociado.attributes
    assert_redirected_to camino_asociado_path(assigns(:camino_asociado))
  end

  test "should destroy camino_asociado" do
    assert_difference('CaminoAsociado.count', -1) do
      delete :destroy, id: @camino_asociado.to_param
    end

    assert_redirected_to camino_asociados_path
  end
end

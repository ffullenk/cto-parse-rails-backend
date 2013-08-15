require 'test_helper'

class AsociadosControllerTest < ActionController::TestCase
  setup do
    @asociado = asociados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:asociados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create asociado" do
    assert_difference('Asociado.count') do
      post :create, asociado: @asociado.attributes
    end

    assert_redirected_to asociado_path(assigns(:asociado))
  end

  test "should show asociado" do
    get :show, id: @asociado.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @asociado.to_param
    assert_response :success
  end

  test "should update asociado" do
    put :update, id: @asociado.to_param, asociado: @asociado.attributes
    assert_redirected_to asociado_path(assigns(:asociado))
  end

  test "should destroy asociado" do
    assert_difference('Asociado.count', -1) do
      delete :destroy, id: @asociado.to_param
    end

    assert_redirected_to asociados_path
  end
end

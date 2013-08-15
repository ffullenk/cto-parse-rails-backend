require 'test_helper'

class CaminosControllerTest < ActionController::TestCase
  setup do
    @camino = caminos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:caminos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create camino" do
    assert_difference('Camino.count') do
      post :create, camino: @camino.attributes
    end

    assert_redirected_to camino_path(assigns(:camino))
  end

  test "should show camino" do
    get :show, id: @camino.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @camino.to_param
    assert_response :success
  end

  test "should update camino" do
    put :update, id: @camino.to_param, camino: @camino.attributes
    assert_redirected_to camino_path(assigns(:camino))
  end

  test "should destroy camino" do
    assert_difference('Camino.count', -1) do
      delete :destroy, id: @camino.to_param
    end

    assert_redirected_to caminos_path
  end
end

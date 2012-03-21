require 'test_helper'

class QandasControllerTest < ActionController::TestCase
  setup do
    @qanda = qandas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:qandas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create qanda" do
    assert_difference('Qanda.count') do
      post :create, :qanda => @qanda.attributes
    end

    assert_redirected_to qanda_path(assigns(:qanda))
  end

  test "should show qanda" do
    get :show, :id => @qanda.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @qanda.to_param
    assert_response :success
  end

  test "should update qanda" do
    put :update, :id => @qanda.to_param, :qanda => @qanda.attributes
    assert_redirected_to qanda_path(assigns(:qanda))
  end

  test "should destroy qanda" do
    assert_difference('Qanda.count', -1) do
      delete :destroy, :id => @qanda.to_param
    end

    assert_redirected_to qandas_path
  end
end

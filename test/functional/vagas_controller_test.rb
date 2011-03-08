require 'test_helper'

class VagasControllerTest < ActionController::TestCase
  setup do
    @vaga = vagas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vagas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vaga" do
    assert_difference('Vaga.count') do
      post :create, :vaga => @vaga.attributes
    end

    assert_redirected_to vaga_path(assigns(:vaga))
  end

  test "should show vaga" do
    get :show, :id => @vaga.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @vaga.to_param
    assert_response :success
  end

  test "should update vaga" do
    put :update, :id => @vaga.to_param, :vaga => @vaga.attributes
    assert_redirected_to vaga_path(assigns(:vaga))
  end

  test "should destroy vaga" do
    assert_difference('Vaga.count', -1) do
      delete :destroy, :id => @vaga.to_param
    end

    assert_redirected_to vagas_path
  end
end

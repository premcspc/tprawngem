require 'test_helper'

class ContentFormsControllerTest < ActionController::TestCase
  setup do
    @content_form = content_forms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:content_forms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create content_form" do
    assert_difference('ContentForm.count') do
      post :create, content_form: { content: @content_form.content, date: @content_form.date, title: @content_form.title }
    end

    assert_redirected_to content_form_path(assigns(:content_form))
  end

  test "should show content_form" do
    get :show, id: @content_form
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @content_form
    assert_response :success
  end

  test "should update content_form" do
    put :update, id: @content_form, content_form: { content: @content_form.content, date: @content_form.date, title: @content_form.title }
    assert_redirected_to content_form_path(assigns(:content_form))
  end

  test "should destroy content_form" do
    assert_difference('ContentForm.count', -1) do
      delete :destroy, id: @content_form
    end

    assert_redirected_to content_forms_path
  end
end

require 'test_helper'

class ExperiencesControllerTest < ActionController::TestCase
  setup do
    @experience = experiences(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:experiences)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create experience" do
    assert_difference('Experience.count') do
      post :create, experience: { begin_date: @experience.begin_date, company: @experience.company, country: @experience.country, description: @experience.description, end_date: @experience.end_date, image: @experience.image, logo: @experience.logo, place: @experience.place, short_description: @experience.short_description, title: @experience.title, type_id: @experience.type_id }
    end

    assert_redirected_to experience_path(assigns(:experience))
  end

  test "should show experience" do
    get :show, id: @experience
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @experience
    assert_response :success
  end

  test "should update experience" do
    patch :update, id: @experience, experience: { begin_date: @experience.begin_date, company: @experience.company, country: @experience.country, description: @experience.description, end_date: @experience.end_date, image: @experience.image, logo: @experience.logo, place: @experience.place, short_description: @experience.short_description, title: @experience.title, type_id: @experience.type_id }
    assert_redirected_to experience_path(assigns(:experience))
  end

  test "should destroy experience" do
    assert_difference('Experience.count', -1) do
      delete :destroy, id: @experience
    end

    assert_redirected_to experiences_path
  end
end

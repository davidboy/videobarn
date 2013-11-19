require 'test_helper'

class RunsControllerTest < ActionController::TestCase
  setup do
    @run = runs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:runs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create run" do
    assert_difference('Run.count') do
      post :create, run: { category: @run.category, classification: @run.classification, fav: @run.fav, horse_id: @run.horse_id, notes: @run.notes, penalty: @run.penalty, placing: @run.placing, rider_id: @run.rider_id, show_id: @run.show_id, time: @run.time }
    end

    assert_redirected_to run_path(assigns(:run))
  end

  test "should show run" do
    get :show, id: @run
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @run
    assert_response :success
  end

  test "should update run" do
    patch :update, id: @run, run: { category: @run.category, classification: @run.classification, fav: @run.fav, horse_id: @run.horse_id, notes: @run.notes, penalty: @run.penalty, placing: @run.placing, rider_id: @run.rider_id, show_id: @run.show_id, time: @run.time }
    assert_redirected_to run_path(assigns(:run))
  end

  test "should destroy run" do
    assert_difference('Run.count', -1) do
      delete :destroy, id: @run
    end

    assert_redirected_to runs_path
  end
end

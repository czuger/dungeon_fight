require 'test_helper'

class CCombatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @c_combat = create( :c_combat )
  end

  test "should get index" do
    get c_combats_url
    assert_response :success
  end

  test "should get new" do
    get new_c_combat_url
    assert_response :success
  end

  test "should create c_combat" do
    assert_difference('CCombat.count') do
      post c_combats_url, params: { c_combat: { result: @c_combat.result } }
    end

    assert_redirected_to c_combat_url(CCombat.last)
  end

  test "should show c_combat" do
    get c_combat_url(@c_combat)
    assert_response :success
  end

  test "should get edit" do
    get edit_c_combat_url(@c_combat)
    assert_response :success
  end

  test "should update c_combat" do
    patch c_combat_url(@c_combat), params: { c_combat: { result: @c_combat.result } }
    assert_redirected_to c_combat_url(@c_combat)
  end

  test "should destroy c_combat" do
    assert_difference('CCombat.count', -1) do
      delete c_combat_url(@c_combat)
    end

    assert_redirected_to c_combats_url
  end
end

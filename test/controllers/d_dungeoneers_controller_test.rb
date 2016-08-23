require 'test_helper'

class DDungeoneersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @d_dungeoneer = d_dungeoneers(:one)
  end

  test "should get index" do
    get d_dungeoneers_url
    assert_response :success
  end

  test "should get new" do
    get new_d_dungeoneer_url
    assert_response :success
  end

  test "should create d_dungeoneer" do
    assert_difference('DDungeoneer.count') do
      post d_dungeoneers_url, params: { d_dungeoneer: { c_class_id: @d_dungeoneer.c_class_id, coo: @d_dungeoneer.coo, desc: @d_dungeoneer.desc, fo: @d_dungeoneer.fo, mem: @d_dungeoneer.mem, name: @d_dungeoneer.name, vol: @d_dungeoneer.vol } }
    end

    assert_redirected_to d_dungeoneer_url(DDungeoneer.last)
  end

  test "should show d_dungeoneer" do
    get d_dungeoneer_url(@d_dungeoneer)
    assert_response :success
  end

  test "should get edit" do
    get edit_d_dungeoneer_url(@d_dungeoneer)
    assert_response :success
  end

  test "should update d_dungeoneer" do
    patch d_dungeoneer_url(@d_dungeoneer), params: { d_dungeoneer: { c_class_id: @d_dungeoneer.c_class_id, coo: @d_dungeoneer.coo, desc: @d_dungeoneer.desc, fo: @d_dungeoneer.fo, mem: @d_dungeoneer.mem, name: @d_dungeoneer.name, vol: @d_dungeoneer.vol } }
    assert_redirected_to d_dungeoneer_url(@d_dungeoneer)
  end

  test "should destroy d_dungeoneer" do
    assert_difference('DDungeoneer.count', -1) do
      delete d_dungeoneer_url(@d_dungeoneer)
    end

    assert_redirected_to d_dungeoneers_url
  end
end

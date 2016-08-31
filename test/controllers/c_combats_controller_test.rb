require 'test_helper'

class CCombatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @f_fight = create( :f_fight )
    @m_monster = create( :m_monster )
    @d_dungeoneer = create( :d_dungeoneer )
    create( :d_dungeoneer_skill, d_dungeoneer_id: @d_dungeoneer.id, s_skill_id: @d_dungeoneer.attack_item.s_skill_id )
  end

  test "should get index" do
    get f_fights_url
    assert_response :success
  end

  test "should get new" do
    get new_f_fight_url
    assert_response :success
  end

  test "should create c_combat" do
    assert_difference('FFight.count') do
      post f_fights_url, params: { monster: @m_monster.id, dungeoneers: { '1'=> @d_dungeoneer.id } }
    end
    assert_redirected_to f_fight_url(FFight.last)
  end

  test "should show c_combat" do
    get f_fight_url(@f_fight)
    assert_response :success
  end

  test "should get edit" do
    get edit_f_fight_url(@f_fight)
    assert_response :success
  end

  test "should update c_combat" do
    patch f_fight_url(@f_fight), params: {co_combat: {result: nil } }
    assert_redirected_to f_fight_url(@f_fight)
  end

  test "should destroy c_combat" do
    assert_difference('FFight.count', -1) do
      delete f_fight_url(@f_fight)
    end

    assert_redirected_to f_fights_url
  end
end

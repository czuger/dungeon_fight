require 'test_helper'

class MMonstersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @m_monster = create( :m_monster )
  end

  test "should get index" do
    get m_monsters_url
    assert_response :success
  end

  test "should get new" do
    get new_m_monster_url
    assert_response :success
  end

  test "should create m_monster" do
    assert_difference('MMonster.count') do
      post m_monsters_url, params: { m_monster: { attack_item_id: @m_monster.attack_item_id, attack_level: @m_monster.attack_level, desc: @m_monster.desc, name: @m_monster.name } }
    end

    assert_redirected_to m_monster_url(MMonster.last)
  end

  test "should show m_monster" do
    get m_monster_url(@m_monster)
    assert_response :success
  end

  test "should get edit" do
    get edit_m_monster_url(@m_monster)
    assert_response :success
  end

  test "should update m_monster" do
    patch m_monster_url(@m_monster), params: { m_monster: { attack_item_id: @m_monster.attack_item_id, attack_level: @m_monster.attack_level, desc: @m_monster.desc, name: @m_monster.name } }
    assert_redirected_to m_monster_url(@m_monster)
  end

  test "should destroy m_monster" do
    assert_difference('MMonster.count', -1) do
      delete m_monster_url(@m_monster)
    end

    assert_redirected_to m_monsters_url
  end
end

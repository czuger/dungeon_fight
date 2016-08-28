require 'test_helper'

class IItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @i_item = create( :i_item )
  end

  test "should get index" do
    get i_items_url
    assert_response :success
  end

  test "should get new" do
    get new_i_item_url
    assert_response :success
  end

  test "should create i_item" do
    assert_difference('IItem.count') do
      post i_items_url, params: { i_item: { attack_dice: @i_item.attack_dice, s_skill_id: @i_item.s_skill_id,
         desc: @i_item.desc, difficulty: @i_item.difficulty, min_level: @i_item.min_level, name: @i_item.name } }
    end

    assert_redirected_to i_item_url(IItem.last)
  end

  test "should show i_item" do
    get i_item_url(@i_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_i_item_url(@i_item)
    assert_response :success
  end

  test "should update i_item" do
    patch i_item_url(@i_item), params: { i_item: { attack_dice: @i_item.attack_dice, s_skill_id: @i_item.s_skill_id,
      desc: @i_item.desc, difficulty: @i_item.difficulty, min_level: @i_item.min_level, name: @i_item.name } }
    assert_redirected_to i_item_url(@i_item)
  end

  test "should destroy i_item" do
    assert_difference('IItem.count', -1) do
      delete i_item_url(@i_item)
    end

    assert_redirected_to i_items_url
  end
end

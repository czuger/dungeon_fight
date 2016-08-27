require 'test_helper'

class CClassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @c_class = create( :c_class )
  end

  test "should get index" do
    get c_classes_url
    assert_response :success
  end

  test "should get new" do
    get new_c_class_url
    assert_response :success
  end

  test "should create c_class" do
    assert_difference('CClass.count') do
      post c_classes_url, params: { c_class: { desc: @c_class.desc, name: @c_class.name } }
    end

    assert_redirected_to c_class_url(CClass.last)
  end

  test "should show c_class" do
    get c_class_url(@c_class)
    assert_response :success
  end

  test "should get edit" do
    get edit_c_class_url(@c_class)
    assert_response :success
  end

  test "should update c_class" do
    patch c_class_url(@c_class), params: { c_class: { desc: @c_class.desc, name: @c_class.name } }
    assert_redirected_to c_class_url(@c_class)
  end

  test "should destroy c_class" do
    assert_difference('CClass.count', -1) do
      delete c_class_url(@c_class)
    end

    assert_redirected_to c_classes_url
  end
end

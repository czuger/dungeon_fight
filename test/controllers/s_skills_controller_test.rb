require 'test_helper'

class SSkillsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @s_skill = create( :s_skill )
  end

  test "should get index" do
    get s_skills_url
    assert_response :success
  end

  test "should get new" do
    get new_s_skill_url
    assert_response :success
  end

  test "should create s_skill" do
    assert_difference('SSkill.count') do
      post s_skills_url, params: { s_skill:
        { desc: @s_skill.desc, difficulty: @s_skill.difficulty, name: @s_skill.name,
          first_attribute: @s_skill.first_attribute, second_attribute: @s_skill.second_attribute } }
    end

    assert_redirected_to s_skill_url(SSkill.last)
  end

  test "should show s_skill" do
    get s_skill_url(@s_skill)
    assert_response :success
  end

  test "should get edit" do
    get edit_s_skill_url(@s_skill)
    assert_response :success
  end

  test "should update s_skill" do
    patch s_skill_url(@s_skill), params: { s_skill: { desc: @s_skill.desc, difficulty: @s_skill.difficulty, name: @s_skill.name } }
    assert_redirected_to s_skill_url(@s_skill)
  end

  test "should destroy s_skill" do
    assert_difference('SSkill.count', -1) do
      delete s_skill_url(@s_skill)
    end

    assert_redirected_to s_skills_url
  end
end

module DDungeoneersHelper

  def learning_skill_select
    skills = @d_dungeoneer.c_class.s_skills
    options =  options_from_collection_for_select( skills, :id, :name, @d_dungeoneer.s_current_learning_d_dungeoneer_skill&.id )
    select_tag( 'learning_skill', options, include_blank: true, class: 'form-control' )
  end

end

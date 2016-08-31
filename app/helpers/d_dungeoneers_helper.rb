module DDungeoneersHelper

  def learning_skill_select
    skills = @d_dungeoneer.c_class.s_skills
    options =  options_from_collection_for_select( skills, :id, :name, @d_dungeoneer.s_current_learning_d_dungeoneer_skill&.id )
    select_tag( 'learning_skill', options, include_blank: true, class: 'form-control' )
  end

  def dungeoneer_attack_item_select( f )
    skills = @d_dungeoneer&.c_class&.s_skills
    items = skills.all.map{ |e| e.i_items }.flatten.uniq
    options =  options_from_collection_for_select( items, :id, :name, @d_dungeoneer.attack_item_id )
    f.select( :attack_item_id, options, class: 'form-control' )
  end


end

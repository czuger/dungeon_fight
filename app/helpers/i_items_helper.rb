module IItemsHelper

  def required_skill_select( f )
    skills = SSkill.all.order( :name )
    options =  options_from_collection_for_select( skills, :id, :name, @i_item.s_skill&.id )
    f.select( :s_skill_id, options, class: 'form-control' )
  end

end

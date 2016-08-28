module IItemsHelper

  def required_skill_select
    skills = SSkill.all.order( :name )
    options =  options_from_collection_for_select( skills, :id, :name, @i_item.s_skill&.id )
    select_tag( 'required_skill', options, include_blank: true, class: 'form-control' )
  end

end

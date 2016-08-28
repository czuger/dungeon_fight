module MMonstersHelper

  def attack_item_select( f )
    skills = IItem.all.order( :name )
    options =  options_from_collection_for_select( skills, :id, :name, @m_monster.attack_item_id )
    f.select( :attack_item_id, options, class: 'form-control' )
  end

end

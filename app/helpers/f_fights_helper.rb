module FFightsHelper

  def monster_select
    monsters = MMonster.all.order( :name )
    options =  options_from_collection_for_select( monsters, :id, :name )
    select_tag( :monster, options, class: 'form-control' )
  end

  def opponent( nb )
    dungeoneer = DDungeoneer.all.order( :name )
    options =  options_from_collection_for_select( dungeoneer, :id, :name )
    select_tag( "dungeoneers[#{nb}]", options, include_blank: true, class: 'form-control' )
  end

  def participant_details( participant )
    attack_challenge = participant.attack_challenge


  end

end

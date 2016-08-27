require 'yaml'

class LangTemplatesGenerator < Rails::Generators::Base

  HIDDEN_COLUMNS_NAMES = %w( id created_at updated_at )
  def create_templates_files

    Rails.application.eager_load!

    [ :fr ].each do |lang|

      ApplicationRecord.send(:subclasses).each do |obj|
        model_name = obj.name.underscore


        columns = obj.columns
        columns.reject!{ |e| HIDDEN_COLUMNS_NAMES.include?( e.name ) }

        data = { fr: { model_name => obj.columns.map{ |e| { e.name => 'Change me' } } } }

        create_file( "lib/templates/yaml/translations/#{lang}/columns_names/#{model_name}.yml", data.to_yaml )

        file_content = File.open( "lib/templates/yaml/translations/#{lang}/base/class.yml", 'r' ).read

        file_content.gsub!( 'object', model_name )
        file_content.gsub!( 'objet', model_name )
        file_content.gsub!( 'objets', model_name.pluralize )

        create_file( "lib/templates/yaml/translations/#{lang}/classes/#{model_name}.yml", file_content )

      end
    end
  end
end

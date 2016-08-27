class FrTranslationsGenerator < Rails::Generators::Base

  def create_yml_files

    Rails.application.eager_load!

    [ :fr ].each do |lang|

      FrTranslationsGenerator.source_root( "lib/templates/yaml/translations/#{lang}/columns_names/" )

      ApplicationRecord.send(:subclasses).map{ |e| e.name.underscore }.each do |model_name|

        copy_file( "#{model_name}.yml", "config/locales/#{lang}/columns_names/#{model_name}.yml" )

        classes_translations = YAML.load_file( "lib/templates/yaml/translations/#{lang}/classes/#{model_name}.yml" )
        classes_translations = classes_translations[lang.to_s]

        Dir.glob( "lib/templates/yaml/translations/#{lang}/views/*.yml" ).each do |entry|

          file_content = File.open( entry, 'r' ).read

          file_content.gsub!( 'plural_table_name', model_name.pluralize )
          file_content.gsub!( 'singular_table_name', model_name )

          file_content.gsub!( 'plural_translated_name', classes_translations[model_name]['plural'] )
          file_content.gsub!( 'singular_translated_name', classes_translations[model_name]['singular'] )

          file_content.gsub!( 'of_a', classes_translations[model_name]['of_a'] )
          
          file_content.gsub!( 'translated_new_capitalized', classes_translations[model_name]['new'].capitalize )
          file_content.gsub!( 'translated_new', classes_translations[model_name]['new'] )

          file_content.gsub!( 'translated_edit_capitalized', classes_translations[model_name]['edit'].capitalize )
          file_content.gsub!( 'translated_edit', classes_translations[model_name]['edit'] )

          file_content.gsub!( 'translated_show_capitalized', classes_translations[model_name]['show'].capitalize )
          file_content.gsub!( 'translated_show', classes_translations[model_name]['show'] )

          create_file( "config/locales/#{lang}/#{model_name.pluralize}/#{File.basename( entry )}", file_content )
        end
      end
    end
  end
end

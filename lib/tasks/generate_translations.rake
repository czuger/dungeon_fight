require 'pp'
require 'yaml'

namespace :generate do
  desc 'Generate translations files'
  task :translations => :environment do

    pp YAML.load_file( 'lib/templates/yaml/translations/classes.yml' )

    Rails.application.eager_load!
    ApplicationRecord.send(:subclasses).map{ |e| e.name.underscore }.each do |model_name|

    end

  end
end

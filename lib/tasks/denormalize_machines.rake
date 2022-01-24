# frozen_string_literal: true
require 'rake'

namespace :articles do
  task denormalize_machines: :environment do
    Article.all.each do |a|
      a.new_machine_ids = a.machine_ids
      a.save!
      print '.'
    end

    puts
    puts "Done."
  end
end

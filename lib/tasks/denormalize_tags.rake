# frozen_string_literal: true
require 'rake'

namespace :articles do
  task denormalize_tags: :environment do
    Article.all.each do |a|
      a.new_tag_ids = a.tag_ids
      a.save!
      print '.'
    end

    puts
    puts "Done."
  end
end

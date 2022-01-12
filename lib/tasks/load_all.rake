# frozen_string_literal: true

require 'rake'

namespace :issues do
  task load_all: :environment do
    puts "Loading all issues..."

    Rake::Task['issues:load_gazettes'].invoke
    Rake::Task['issues:load_runs'].invoke
    Rake::Task['issues:load_tpugs'].invoke
    Rake::Task['issues:load_torpets'].invoke
    Rake::Task['issues:load_transactors'].invoke
    Rake::Task['issues:load_worlds'].invoke

    puts "Done."
  end
end

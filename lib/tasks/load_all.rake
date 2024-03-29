# frozen_string_literal: true
require 'rake'

namespace :issues do
  task load_all: :environment do
    puts "Loading all issues..."

    Rake::Task['issues:load_ahoys'].invoke
    Rake::Task['issues:load_power_plays'].invoke
    Rake::Task['issues:load_cbm_micros'].invoke
    Rake::Task['issues:load_cbms'].invoke
    Rake::Task['issues:load_diehards'].invoke
    Rake::Task['issues:load_gazette_disks'].invoke
    Rake::Task['issues:load_gazette_sections'].invoke
    Rake::Task['issues:load_gazettes'].invoke
    Rake::Task['issues:load_geoworlds'].invoke
    Rake::Task['issues:load_infos'].invoke
    Rake::Task['issues:load_runs'].invoke
    Rake::Task['issues:load_torpets'].invoke
    Rake::Task['issues:load_tpugs'].invoke
    Rake::Task['issues:load_transactors'].invoke
    Rake::Task['issues:load_worlds'].invoke
    Rake::Task['issues:load_commanders'].invoke
    Rake::Task['issues:load_computes'].invoke
    Rake::Task['issues:load_compute_iis'].invoke

    puts "Done."
  end
end

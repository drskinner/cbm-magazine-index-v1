# frozen_string_literal: true

require 'rake'

def save_new_compute_ii!(month:, year:, volume: nil, number: nil, special: nil)
  compute_ii_id = Magazine.find_by(slug: 'compute_ii').id
  @issue_number += 1
  print '.'
  
  unless Issue.where(magazine_id: compute_ii_id, month: month, year: year).exists?    
    Issue.create!(
      magazine_id: compute_ii_id,
      year: year,
      month: month,
      volume: volume,
      number: number,
      sequence: @issue_number,
      special: special
    )
  end
end

def create_compute_iis!(month:, year:, volume:, number:, issues:)
  for i in 0..(issues-1)
    save_new_compute_ii!(month: month+i, year: year, volume: volume, number: number+i)
  end
end

namespace :issues do
  task load_compute_iis: :environment do
    puts "Loading issues for COMPUTE II"
    @issue_number = 0

    save_new_compute_ii!(month: 4, year: 1980, volume: nil, number: nil)
    save_new_compute_ii!(month: 6, year: 1980, volume: nil, number: nil)
    save_new_compute_ii!(month: 8, year: 1980, volume: nil, number: nil)

    puts
    puts "#{Issue.where(magazine_id: Magazine.find_by(slug: 'compute_ii').id).count} COMPUTE IIs."
  end
end

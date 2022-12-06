# frozen_string_literal: true

require 'rake'

def save_new_cbm!(month:, year:, volume: nil, number: nil, special: nil)
  cbm_id = Magazine.find_by(slug: 'cbm').id
  @issue_number += 1
  print '.'

  unless Issue.where(magazine_id: cbm_id, sequence: @issue_number).exists?
    Issue.create!(
      magazine_id: cbm_id,
      year: year,
      month: month,
      volume: volume,
      number: number,
      sequence: @issue_number,
      special: special
    )
  end
end

def create_cbms!(month:, year:, volume:, number:, issues:)
  for i in 0..(issues-1)
    save_new_cbm!(month: month+i, year: year, volume: volume, number: number+i)
  end
end

namespace :issues do
  task load_cbms: :environment do
    puts "Loading issues for Commodore Microcomputer..."
    @issue_number = 0

    create_cbms!(month: 1, year: 1987, volume:  8, number: 1, issues: 12)
    create_cbms!(month: 1, year: 1988, volume:  9, number: 1, issues: 12)
    create_cbms!(month: 1, year: 1989, volume: 10, number: 1, issues: 10)
    
    puts
    puts "#{Issue.where(magazine_id: Magazine.find_by(slug: 'cbm').id).count} Commodore magazines."
  end
end

# frozen_string_literal: true

require 'rake'

def save_new_section!(month:, year:, volume: nil, number: nil, special: nil)
  section_id = Magazine.find_by(slug: 'gazette_section').id
  @issue_number += 1
  print '.'

  unless Issue.where(magazine_id: section_id, month: month, year: year).exists?    
    Issue.create!(
      magazine_id: section_id,
      year: year,
      month: month,
      volume: volume,
      number: number,
      sequence: @issue_number,
      special: special
    )
  end
end

def create_sections!(month:, year:, volume:, number:, issues:)
  for i in 0..(issues-1)
    save_new_section!(month: month+i, year: year, volume: volume, number: number+i)
  end
end

namespace :issues do
  task load_gazette_sections: :environment do
    puts "Loading issues for Compute!'s Gazette Special Section..."
    @issue_number = 0

    create_sections!(month: 10, year: 1990, volume: 12, number: 10, issues: 3)
    create_sections!(month:  1, year: 1991, volume: 13, number:  1, issues: 12)
    create_sections!(month:  1, year: 1992, volume: 14, number:  1, issues: 2)
    create_sections!(month:  4, year: 1992, volume: 14, number:  3, issues: 9)
    create_sections!(month:  1, year: 1993, volume: 15, number:  1, issues: 12)
    
    puts
    puts "#{Issue.where(magazine_id: Magazine.find_by(slug: 'gazette_section').id).count} Gazette Sections."
  end
end

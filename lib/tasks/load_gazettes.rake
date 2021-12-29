# frozen_string_literal: true

require 'rake'

def save_new_gazette!(month:, year:, volume: nil, number: nil, special: nil)
  gazette_id = Magazine.find_by(slug: 'gazette').id
  @issue_number += 1
  print '.'

  unless Issue.where(magazine_id: gazette_id, month: month, year: year).exists?    
    Issue.create!(
      magazine_id: gazette_id,
      year: year,
      month: month,
      volume: volume,
      number: number,
      sequence: @issue_number,
      special: special
    )
  end
end

def create_gazettes!(month:, year:, volume:, number:, issues:)
  for i in 0..(issues-1)
    save_new_gazette!(month: month+i, year: year, volume: volume, number: number+i)
  end
end

namespace :issues do
  task load_gazettes: :environment do
    puts "Loading issues for Compute!'s Gazette..."
    @issue_number = 0

    create_gazettes!(month: 7, year: 1983, volume: 1, number: 1, issues: 6)
    create_gazettes!(month: 1, year: 1984, volume: 2, number: 1, issues: 12)
    create_gazettes!(month: 1, year: 1985, volume: 3, number: 1, issues: 12)
    create_gazettes!(month: 1, year: 1986, volume: 4, number: 1, issues: 12)
    create_gazettes!(month: 1, year: 1987, volume: 5, number: 1, issues: 12)
    create_gazettes!(month: 1, year: 1988, volume: 6, number: 1, issues: 12)
    create_gazettes!(month: 1, year: 1989, volume: 7, number: 1, issues: 12) 
    create_gazettes!(month: 1, year: 1990, volume: 8, number: 1, issues: 6)
    
    puts
    puts "#{Issue.where(magazine_id: Magazine.find_by(slug: 'gazette').id).count} Gazettes."
  end
end

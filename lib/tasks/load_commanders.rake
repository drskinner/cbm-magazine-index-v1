# frozen_string_literal: true

require 'rake'

def save_new_commander!(month:, year:, volume: nil, number: nil, special: nil)
  commander_id = Magazine.find_by(slug: 'commander').id
  @issue_number += 1
  print '.'

  unless Issue.where(magazine_id: commander_id, sequence: @issue_number).exists?
    Issue.create!(
      magazine_id: commander_id,
      year: year,
      month: month,
      volume: volume,
      number: number,
      sequence: @issue_number,
      special: special
    )
  end
end

def create_commanders!(month:, year:, volume:, number:, issues:)
  for i in 0..(issues-1)
    save_new_commander!(month: month+i, year: year, volume: volume, number: number+i)
  end
end

namespace :issues do
  task load_commanders: :environment do
    puts "Loading issues for Commander..."
    @issue_number = 0

    save_new_commander!(month: 12, year: 1982, volume: 1, number: 1)
    
    save_new_commander!(month:  1, year: 1983, volume: 1, number: 2)
    save_new_commander!(month:  2, year: 1983, volume: 1, number: 3)
    save_new_commander!(month:  3, year: 1983, volume: 1, number: 4)
    save_new_commander!(month:  5, year: 1983, volume: 1, number: 6)
    save_new_commander!(month:  6, year: 1983, volume: 1, number: 7)
    save_new_commander!(month:  7, year: 1983, volume: 1, number: 8)
    save_new_commander!(month:  8, year: 1983, volume: 1, number: 9)
    save_new_commander!(month:  9, year: 1983, volume: 1, number: 10)
    save_new_commander!(month: 10, year: 1983, volume: 1, number: 11)
    save_new_commander!(month: 11, year: 1983, volume: 1, number: 12)
    
    save_new_commander!(month: 12, year: 1983, volume: 2, number: 1) # 13
    
    save_new_commander!(month:  2, year: 1984, volume: 2, number: 2) # 14
    save_new_commander!(month:  3, year: 1984, volume: 2, number: 3)
    save_new_commander!(month:  4, year: 1984, volume: 2, number: 4)
    save_new_commander!(month:  5, year: 1984, volume: 2, number: 5)
    save_new_commander!(month:  6, year: 1984, volume: 2, number: 6)

    puts
    puts "#{Issue.where(magazine_id: Magazine.find_by(slug: 'commander').id).count} Commander magazines."
  end
end

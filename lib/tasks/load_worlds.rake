# frozen_string_literal: true

require 'rake'

def save_new_world!(month:, year:, volume: nil, number: nil, special: nil)
  world_id = Magazine.find_by(slug: 'cbm_world').id
  @issue_number += 1
  print '.'

  unless Issue.where(magazine_id: world_id, sequence: @issue_number).exists?
    Issue.create!(
      magazine_id: world_id,
      year: year,
      month: month,
      volume: volume,
      number: number,
      sequence: @issue_number,
      special: special
    )
  end
end

def create_worlds!(month:, year:, volume:, number:, issues:)
  for i in 0..(issues-1)
    save_new_world!(month: month+i, year: year, volume: volume, number: number+i)
  end
end

namespace :issues do
  task load_worlds: :environment do
    puts "Loading issues for Commodore World..."
    @issue_number = 0

    save_new_world!(month: 4, year: 1994, volume: 1, number: 1) # 01
    save_new_world!(month: 6, year: 1994, volume: 1, number: 2)
    save_new_world!(month: nil, year: 1994, volume: 1, number: 3)
    save_new_world!(month: nil, year: 1994, volume: 1, number: 4)
    save_new_world!(month: nil, year: 1994, volume: 1, number: 5)

    save_new_world!(month: nil, year: 1995, volume: 2, number: 1) # 06
    save_new_world!(month: nil, year: 1995, volume: 2, number: 2)
    save_new_world!(month: nil, year: 1995, volume: 2, number: 3)
    save_new_world!(month: 8, year: 1995, volume: 2, number: 4)
    save_new_world!(month: 10, year: 1995, volume: 2, number: 5) # 10
    save_new_world!(month: 11, year: 1995, volume: 2, number: 6)
    save_new_world!(month: 1, year: 1996, volume: 2, number: 7)
    save_new_world!(month: 2, year: 1996, volume: 2, number: 8)

    save_new_world!(month: 4, year: 1996, volume: nil, number: nil) # 14
    save_new_world!(month: 5, year: 1996, volume: nil, number: nil)
    save_new_world!(month: 8, year: 1996, volume: nil, number: nil)
    save_new_world!(month: 10, year: 1996, volume: nil, number: nil)

    save_new_world!(month: 12, year: 1996, volume: nil, number: nil) # 18
    save_new_world!(month: 2, year: 1997, volume: nil, number: nil)
    save_new_world!(month: 7, year: 1997, volume: nil, number: nil)
    save_new_world!(month: 10, year: 1997, volume: nil, number: nil)

    save_new_world!(month: 2, year: 1998, volume: nil, number: nil) # 22
    save_new_world!(month: 6, year: 1998, volume: nil, number: nil)
    save_new_world!(month: 10, year: 1998, volume: nil, number: nil)
    save_new_world!(month: 3, year: 1999, volume: nil, number: nil)
    
    puts
    puts "#{Issue.where(magazine_id: Magazine.find_by(slug: 'cbm_world').id).count} Commodore Worlds."
  end
end

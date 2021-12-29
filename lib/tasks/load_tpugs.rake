# frozen_string_literal: true

require 'rake'

def save_new_tpug!(month:, year:, volume: nil, number: nil, special: nil)
  tpug_id = Magazine.find_by(slug: 'tpug').id
  @issue_number += 1
  print '.'
  unless Issue.where(magazine_id: tpug_id, month: month, year: year).exists?    
    Issue.create!(
      magazine_id: tpug_id,
      year: year,
      month: month,
      volume: volume,
      number: number,
      sequence: @issue_number,
      special: special
    )
  end
end

def create_tpugs!(month:, year:, volume:, number:, issues:)
  for i in 0..(issues-1)
    save_new_tpug!(month: month+i, year: year, volume: volume, number: number+i)
  end
end

namespace :issues do
  task load_tpugs: :environment do
    puts "Loading issues for TPUG Magazine..."
    @issue_number = 0

    save_new_tpug!(month: 2, year: 1984, volume: nil, number: nil)
    save_new_tpug!(month: 3, year: 1984, volume: nil, number: nil)
    save_new_tpug!(month: 5, year: 1984, volume: nil, number: nil)
    save_new_tpug!(month: 6, year: 1984, volume: nil, number: nil) # 04

    save_new_tpug!(month: 7, year: 1984, volume: nil, number: nil)
    save_new_tpug!(month: 9, year: 1984, volume: nil, number: nil)
    save_new_tpug!(month: 10, year: 1984, volume: nil, number: nil)
    save_new_tpug!(month: 11, year: 1984, volume: nil, number: nil) # 08

    save_new_tpug!(month: 12, year: 1984, volume: nil, number: nil)
    save_new_tpug!(month: 1, year: 1985, volume: nil, number: nil)
    save_new_tpug!(month: 2, year: 1985, volume: nil, number: nil)
    save_new_tpug!(month: 3, year: 1985, volume: nil, number: nil) # 12

    save_new_tpug!(month: 4, year: 1985, volume: nil, number: nil)
    save_new_tpug!(month: 5, year: 1985, volume: nil, number: nil)
    save_new_tpug!(month: 6, year: 1985, volume: nil, number: nil)
    save_new_tpug!(month: 8, year: 1985, volume: nil, number: nil) # 16

    save_new_tpug!(month: 10, year: 1985, volume: nil, number: nil)
    save_new_tpug!(month: 11, year: 1985, volume: nil, number: nil)
    save_new_tpug!(month: 12, year: 1985, volume: nil, number: nil)
    save_new_tpug!(month: 1, year: 1986, volume: nil, number: nil) # 20

    save_new_tpug!(month: 3, year: 1986, volume: nil, number: nil)
    save_new_tpug!(month: 4, year: 1986, volume: nil, number: nil)
    save_new_tpug!(month: 5, year: 1986, volume: nil, number: nil)
    save_new_tpug!(month: 6, year: 1986, volume: nil, number: nil) # 24

    save_new_tpug!(month: 8, year: 1986, volume: nil, number: nil)

    puts
    puts "#{Issue.where(magazine_id: Magazine.find_by(slug: 'tpug').id).count} TPUGs."
  end
end

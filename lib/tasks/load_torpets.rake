# frozen_string_literal: true

require 'rake'

def save_new_torpet!(month:, year:, volume: nil, number: nil, special: nil)
  torpet_id = Magazine.find_by(slug: 'torpet').id
  @issue_number += 1
  print '.'
  
  unless Issue.where(magazine_id: torpet_id, month: month, year: year).exists?    
    Issue.create!(
      magazine_id: torpet_id,
      year: year,
      month: month,
      volume: volume,
      number: number,
      sequence: @issue_number,
      special: special
    )
  end
end

def create_torpets!(month:, year:, volume:, number:, issues:)
  for i in 0..(issues-1)
    save_new_torpet!(month: month+i, year: year, volume: volume, number: number+i)
  end
end

namespace :issues do
  task load_torpets: :environment do
    puts "Loading issues for TORPET Bulletin..."
    @issue_number = 0

    save_new_torpet!(month: 11, year: 1980, volume: nil, number: nil)
    save_new_torpet!(month: 1, year: 1981, volume: nil, number: nil)
    save_new_torpet!(month: 2, year: 1981, volume: nil, number: nil)
    save_new_torpet!(month: 3, year: 1981, volume: nil, number: nil) # 04

    save_new_torpet!(month: 4, year: 1981, volume: nil, number: nil)
    save_new_torpet!(month: 6, year: 1981, volume: nil, number: nil)
    save_new_torpet!(month: 10, year: 1981, volume: nil, number: nil)
    save_new_torpet!(month: 1, year: 1982, volume: nil, number: nil) # 08

    save_new_torpet!(month: 4, year: 1982, volume: nil, number: nil)
    save_new_torpet!(month: 5, year: 1982, volume: nil, number: nil)
    save_new_torpet!(month: 6, year: 1982, volume: nil, number: nil)
    save_new_torpet!(month: 8, year: 1982, volume: nil, number: nil) # 12

    save_new_torpet!(month: 9, year: 1982, volume: nil, number: nil)
    save_new_torpet!(month: 10, year: 1982, volume: nil, number: nil)
    save_new_torpet!(month: 11, year: 1982, volume: nil, number: nil)
    save_new_torpet!(month: 1, year: 1983, volume: nil, number: nil) # 16

    save_new_torpet!(month: 2, year: 1983, volume: nil, number: nil)
    save_new_torpet!(month: 3, year: 1983, volume: nil, number: nil)
    save_new_torpet!(month: 5, year: 1983, volume: nil, number: nil)
    save_new_torpet!(month: 6, year: 1983, volume: nil, number: nil) # 20

    save_new_torpet!(month: 7, year: 1983, volume: nil, number: nil)
    save_new_torpet!(month: 8, year: 1983, volume: nil, number: nil)
    save_new_torpet!(month: 9, year: 1983, volume: nil, number: nil)
    save_new_torpet!(month: 10, year: 1983, volume: nil, number: nil) # 24

    save_new_torpet!(month: 11, year: 1983, volume: nil, number: nil)
    save_new_torpet!(month: 1, year: 1984, volume: nil, number: nil)
    save_new_torpet!(month: 5, year: 1984, volume: nil, number: nil)
    save_new_torpet!(month: 6, year: 1984, volume: nil, number: nil) # 28

    puts
    puts "#{Issue.where(magazine_id: Magazine.find_by(slug: 'torpet').id).count} TORPETs."
  end
end

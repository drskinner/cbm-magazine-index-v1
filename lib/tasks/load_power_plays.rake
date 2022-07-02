# frozen_string_literal: true

require 'rake'

def save_new_power_play!(month:, year:, volume: nil, number: nil, special: nil)
  power_play_id = Magazine.find_by(slug: 'power_play').id
  @issue_number += 1
  print '.'

  unless Issue.where(magazine_id: power_play_id, sequence: @issue_number).exists?
    Issue.create!(
      magazine_id: power_play_id,
      year: year,
      month: month,
      volume: volume,
      number: number,
      sequence: @issue_number,
      special: special
    )
  end
end

def create_power_plays!(month:, year:, volume:, number:, issues:)
  for i in 0..(issues-1)
    save_new_power_play!(month: month+i, year: year, volume: volume, number: number+i)
  end
end

namespace :issues do
  task load_power_plays: :environment do
    puts "Loading issues for Commodore Power/Play..."
    @issue_number = 0

    save_new_power_play!(month: nil, year: 1982, volume: 1, number: 1, special: 'Premiere Issue') # 01
    save_new_power_play!(month: 9, year: 1982, volume: 1, number: 2, special: 'Fall 1982')
    save_new_power_play!(month: 12, year: 1982, volume: 1, number: 3, special: 'Winter 1982')

    save_new_power_play!(month: 3, year: 1983, volume: 2, number: 1, special: 'Spring 1983') # 04
    save_new_power_play!(month: 6, year: 1983, volume: 2, number: 2, special: 'Summer 1983')
    save_new_power_play!(month: 9, year: 1983, volume: 2, number: 3, special: 'Fall 1983')
    save_new_power_play!(month: 12, year: 1983, volume: 2, number: 4, special: 'Winter 1983')

    save_new_power_play!(month: 3, year: 1984, volume: 3, number: 1, special: 'Spring 1984') # 08
    save_new_power_play!(month: 6, year: 1984, volume: 3, number: 2, special: 'June/July 1984')
    save_new_power_play!(month: 8, year: 1984, volume: 3, number: 3, special: 'August/September 1984')
    save_new_power_play!(month: 10, year: 1984, volume: 3, number: 4, special: 'October/November 1984')
    save_new_power_play!(month: 12, year: 1984, volume: 3, number: 5, special: 'December/January 1984-85')

    save_new_power_play!(month: 2, year: 1985, volume: 4, number: 1, special: 'February/March 1985') # 13
    save_new_power_play!(month: 4, year: 1985, volume: 4, number: 2, special: 'April/May 1985')
    save_new_power_play!(month: 6, year: 1985, volume: 4, number: 3, special: 'June/July 1985')
    save_new_power_play!(month: 8, year: 1985, volume: 4, number: 4, special: 'August/September 1985')
    save_new_power_play!(month: 10, year: 1985, volume: 4, number: 5, special: 'October/November 1985')
    save_new_power_play!(month: 1, year: 1986, volume: 4, number: 6, special: 'December/January 1985-86')
    
    save_new_power_play!(month: 2, year: 1986, volume: 5, number: 1, special: 'February/March 1986') # 19
    save_new_power_play!(month: 4, year: 1986, volume: 5, number: 2, special: 'April/May 1986')
    save_new_power_play!(month: 6, year: 1986, volume: 5, number: 3, special: 'June/July 1986')
    save_new_power_play!(month: 8, year: 1986, volume: 5, number: 4, special: 'August/September 1986')
    save_new_power_play!(month: 10, year: 1986, volume: 5, number: 5, special: 'October/November 1986')

    puts
    puts "#{Issue.where(magazine_id: Magazine.find_by(slug: 'power_play').id).count} Commodore Power/Play magazines."
  end
end

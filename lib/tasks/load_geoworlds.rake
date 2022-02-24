# frozen_string_literal: true

require 'rake'

def save_new_geoworld!(month:, year:, volume: nil, number: nil, special: nil, seq: nil)
  geoworld_id = Magazine.find_by(slug: 'geoworld').id
  @issue_number += 1
  print '.'

  unless Issue.where(magazine_id: geoworld_id, month: month, year: year, sequence: seq).exists?
    Issue.create!(
      magazine_id: geoworld_id,
      year: year,
      month: month,
      volume: volume,
      number: number,
      sequence: @issue_number,
      special: special
    )
  end
end

def create_geoworlds!(month:, year:, volume:, number:, issues:)
  for i in 0..(issues-1)
    save_new_geoworld!(month: month+i, year: year, volume: volume, number: number+i, seq: @issue_number + 1)
  end
end

namespace :issues do
  task load_geoworlds: :environment do
    puts "Loading issues for geoWorld..."
    @issue_number = 0

    create_geoworlds!(month: 3, year: 1987, volume: 1, number: 1, issues: 4)
    create_geoworlds!(month: 8, year: 1987, volume: 1, number: 5, issues: 5)
    create_geoworlds!(month: 1, year: 1988, volume: 2, number: 1, issues: 3)

    save_new_geoworld!(month: nil, year: 1988, volume: 2, number: 4, seq: 13)
    save_new_geoworld!(month: nil, year: 1988, volume: 2, number: 5, seq: 14)
    save_new_geoworld!(month: nil, year: 1988, volume: nil, number: nil, seq: 15)
    save_new_geoworld!(month: 7, year: 1988, volume: nil, number: nil, seq: 16)
    save_new_geoworld!(month: nil, year: 1988, volume: nil, number: nil, seq: 17)

    save_new_geoworld!(month: nil, year: 1989, volume: nil, number: nil, seq: 18)
    save_new_geoworld!(month: nil, year: 1989, volume: nil, number: nil, seq: 19)
    save_new_geoworld!(month: nil, year: 1989, volume: nil, number: nil, seq: 20)
    save_new_geoworld!(month: nil, year: 1989, volume: nil, number: nil, seq: 21)
    save_new_geoworld!(month: nil, year: 1989, volume: nil, number: nil, seq: 22)
    
    save_new_geoworld!(month: nil, year: 1990, volume: nil, number: nil, seq: 23)
    save_new_geoworld!(month: nil, year: 1990, volume: nil, number: nil, seq: 24)
    save_new_geoworld!(month: nil, year: 1990, volume: nil, number: nil, seq: 25)
    save_new_geoworld!(month: nil, year: 1991, volume: nil, number: nil, seq: 26)

    puts
    puts "#{Issue.where(magazine_id: Magazine.find_by(slug: 'geoworld').id).count} geoWorlds."
  end
end

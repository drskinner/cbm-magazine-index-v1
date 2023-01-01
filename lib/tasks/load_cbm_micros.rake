# frozen_string_literal: true

require 'rake'

def save_new_cbm_micro!(month:, year:, volume: nil, number: nil, special: nil)
  cbm_micro_id = Magazine.find_by(slug: 'cbm_micro').id
  @issue_number += 1
  print '.'

  unless Issue.where(magazine_id: cbm_micro_id, sequence: @issue_number).exists?
    Issue.create!(
      magazine_id: cbm_micro_id,
      year: year,
      month: month,
      volume: volume,
      number: number,
      sequence: @issue_number,
      special: special
    )
  end
end

def create_cbm_micros!(month:, year:, volume:, number:, issues:)
  for i in 0..(issues-1)
    save_new_cbm_micro!(month: month+i, year: year, volume: volume, number: number+i)
  end
end

namespace :issues do
  task load_cbm_micros: :environment do
    puts "Loading issues for Commodore Microcomputer..."
    @issue_number = 13

    save_new_cbm_micro!(month: 10, year: 1981, volume: 2, number: 4) # 14
    save_new_cbm_micro!(month: 12, year: 1981, volume: 2, number: 5)

    save_new_cbm_micro!(month:  2, year: 1982, volume: 3, number: 1) # 16
    save_new_cbm_micro!(month:  4, year: 1982, volume: 3, number: 2)
    save_new_cbm_micro!(month:  6, year: 1982, volume: 3, number: 3)
    save_new_cbm_micro!(month:  8, year: 1982, volume: 3, number: 4)
    save_new_cbm_micro!(month: 10, year: 1982, volume: 3, number: 5)
    save_new_cbm_micro!(month: 12, year: 1982, volume: 3, number: 6)

    save_new_cbm_micro!(month:  2, year: 1983, volume: 4, number: 1) # 22
    save_new_cbm_micro!(month:  4, year: 1983, volume: 4, number: 2)
    save_new_cbm_micro!(month:  6, year: 1983, volume: 4, number: 3)
    save_new_cbm_micro!(month:  8, year: 1983, volume: 4, number: 4)
    save_new_cbm_micro!(month: 10, year: 1983, volume: 4, number: 5)
    save_new_cbm_micro!(month: 12, year: 1983, volume: 4, number: 6)

    save_new_cbm_micro!(month:  2, year: 1984, volume: 5, number: 1) # 28
    save_new_cbm_micro!(month:  5, year: 1984, volume: 5, number: 2)
    save_new_cbm_micro!(month:  7, year: 1984, volume: 5, number: 3)
    save_new_cbm_micro!(month:  9, year: 1984, volume: 5, number: 4)
    save_new_cbm_micro!(month: 11, year: 1984, volume: 5, number: 5)

    save_new_cbm_micro!(month:  1, year: 1985, volume: 6, number: 1) # 33
    save_new_cbm_micro!(month:  3, year: 1985, volume: 6, number: 2)
    save_new_cbm_micro!(month:  5, year: 1985, volume: 6, number: 3)
    save_new_cbm_micro!(month:  7, year: 1985, volume: 6, number: 4)
    save_new_cbm_micro!(month:  9, year: 1985, volume: 6, number: 5)
    save_new_cbm_micro!(month: 11, year: 1985, volume: 6, number: 6)

    save_new_cbm_micro!(month:  1, year: 1986, volume: 7, number: 1) # 39
    save_new_cbm_micro!(month:  3, year: 1986, volume: 7, number: 2)
    save_new_cbm_micro!(month:  5, year: 1986, volume: 7, number: 3)
    save_new_cbm_micro!(month:  7, year: 1986, volume: 7, number: 4)
    save_new_cbm_micro!(month:  9, year: 1986, volume: 7, number: 5)
    save_new_cbm_micro!(month: 11, year: 1986, volume: 7, number: 6)
    
    puts
    puts "#{Issue.where(magazine_id: Magazine.find_by(slug: 'cbm_micro').id).count} Commodore Microcomputer magazines."
  end
end

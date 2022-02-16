# frozen_string_literal: true

require 'rake'

def save_new_diehard!(month:, year:, volume: nil, number: nil, special: nil)
  diehard_id = Magazine.find_by(slug: 'diehard').id
  @issue_number += 1
  print '.'

  unless Issue.where(magazine_id: diehard_id, month: month, year: year).exists?
    Issue.create!(
      magazine_id: diehard_id,
      year: year,
      month: month,
      volume: volume,
      number: number,
      sequence: @issue_number,
      special: special
    )
  end
end

def create_diehards!(month:, year:, volume:, number:, issues:)
  for i in 0..(issues-1)
    save_new_diehard!(month: month+i, year: year, volume: volume, number: number+i)
  end
end

namespace :issues do
  task load_diehards: :environment do
    puts "Loading issues for dieHard Magazine..."
    @issue_number = 0

    create_diehards!(month: 5, year: 1992, volume: 1, number: 1, issues: 3)
    create_diehards!(month: 10, year: 1992, volume: 1, number: 4, issues: 2)

    create_diehards!(month: 1, year: 1993, volume: 2, number: 1, issues: 6)
    create_diehards!(month: 8, year: 1993, volume: 2, number: 7, issues: 5)

    save_new_diehard!(month: 1, year: 1994, volume: 3, number: 1) # 17
    save_new_diehard!(month: 3, year: 1994, volume: 3, number: 2)
    save_new_diehard!(month: 4, year: 1994, volume: 3, number: 3)
    save_new_diehard!(month: 6, year: 1994, volume: 3, number: 4)
    save_new_diehard!(month: 7, year: 1994, volume: 3, number: 5) # 21
    save_new_diehard!(month: 9, year: 1994, volume: 3, number: 6)
    save_new_diehard!(month: 10, year: 1994, volume: 3, number: 7)
    
    puts
    puts "#{Issue.where(magazine_id: Magazine.find_by(slug: 'diehard').id).count} dieHard Magazines."
  end
end

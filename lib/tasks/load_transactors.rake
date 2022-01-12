# frozen_string_literal: true

require 'rake'

def save_new_transactor!(month:, year:, volume: nil, number: nil, special: nil)
  transactor_id = Magazine.find_by(slug: 'transactor').id
  @issue_number += 1
  print '.'

  unless Issue.where(magazine_id: transactor_id, volume: volume, number: number).exists?    
    Issue.create!(
      magazine_id: transactor_id,
      year: year,
      month: month,
      volume: volume,
      number: number,
      sequence: @issue_number,
      special: special
    )
  end
end

def create_transactors!(month:, year:, volume:, number:, issues:)
  for i in 0..(issues-1)
    save_new_transactor!(month: month+i, year: year, volume: volume, number: number+i)
  end
end

namespace :issues do
  task load_transactors: :environment do
    puts "Loading issues for The Transactor..."
    @issue_number = 0

    # many of the early Transactors are not dated.
    # some of the publication years were supplied by 
    # https://www.commodore.ca/commodore-gallery/the-transactor-magazine

    save_new_transactor!(month: 4, year: 1978, volume: 1, number: 1)
    save_new_transactor!(month: 6, year: 1978, volume: 1, number: 2)
    save_new_transactor!(month: 7, year: 1978, volume: 1, number: 3)
    save_new_transactor!(month: nil, year: 1978, volume: 1, number: 4)
    save_new_transactor!(month: 9, year: 1978, volume: 1, number: 5)
    save_new_transactor!(month: 10, year: 1978, volume: 1, number: 6)
    save_new_transactor!(month: 12, year: 1978, volume: 1, number: 7)
    create_transactors!(month: 1, year: 1979, volume: 1, number: 8, issues: 4)

    create_transactors!(month: 5, year: 1979, volume: 2, number: 1, issues: 4)
    save_new_transactor!(month: 10, year: 1979, volume: 2, number: 5)
    save_new_transactor!(month: 11, year: 1979, volume: 2, number: 6)
    save_new_transactor!(month: 12, year: 1979, volume: 2, number: 7)
    save_new_transactor!(month: 1, year: 1980, volume: 2, number: 8)
    save_new_transactor!(month: nil, year: 1980, volume: 2, number: 9)
    save_new_transactor!(month: nil, year: 1980, volume: 2, number: 10)
    save_new_transactor!(month: nil, year: 1980, volume: 2, number: 11)
    save_new_transactor!(month: nil, year: 1981, volume: 2, number: 12)

    save_new_transactor!(month: nil, year: 1981, volume: 3, number: 1)
    save_new_transactor!(month: nil, year: 1981, volume: 3, number: 2)
    save_new_transactor!(month: nil, year: 1981, volume: 3, number: 3)
    save_new_transactor!(month: nil, year: 1982, volume: 3, number: 4)
    save_new_transactor!(month: nil, year: 1982, volume: 3, number: 5)
    save_new_transactor!(month: nil, year: 1982, volume: 3, number: 6)

    save_new_transactor!(month: 9, year: 1982, volume: 4, number: 1)
    save_new_transactor!(month: 1, year: 1983, volume: 4, number: 2)
    save_new_transactor!(month: 4, year: 1983, volume: 4, number: 3)
    save_new_transactor!(month: 7, year: 1983, volume: 4, number: 4)
    save_new_transactor!(month: nil, year: 1983, volume: 4, number: 5)
    save_new_transactor!(month: nil, year: 1983, volume: 4, number: 6)

    save_new_transactor!(month: nil, year: 1984, volume: 5, number: 1)
    save_new_transactor!(month: nil, year: 1984, volume: 5, number: 2)
    save_new_transactor!(month: 11, year: 1984, volume: 5, number: 3)
    save_new_transactor!(month: 1, year: 1985, volume: 5, number: 4)
    save_new_transactor!(month: 3, year: 1985, volume: 5, number: 5)
    save_new_transactor!(month: 5, year: 1985, volume: 5, number: 6)

    save_new_transactor!(month: 7, year: 1985, volume: 6, number: 1)
    save_new_transactor!(month: 9, year: 1985, volume: 6, number: 2)
    save_new_transactor!(month: 11, year: 1985, volume: 6, number: 3)
    save_new_transactor!(month: 1, year: 1986, volume: 6, number: 4)
    save_new_transactor!(month: 3, year: 1986, volume: 6, number: 5)
    save_new_transactor!(month: 5, year: 1986, volume: 6, number: 6)

    save_new_transactor!(month: 7, year: 1986, volume: 7, number: 1)
    save_new_transactor!(month: 9, year: 1986, volume: 7, number: 2)
    save_new_transactor!(month: 11, year: 1986, volume: 7, number: 3)
    save_new_transactor!(month: 1, year: 1987, volume: 7, number: 4)
    save_new_transactor!(month: 3, year: 1987, volume: 7, number: 5)
    save_new_transactor!(month: 5, year: 1987, volume: 7, number: 6)

    save_new_transactor!(month: 7, year: 1987, volume: 8, number: 1)
    save_new_transactor!(month: 9, year: 1987, volume: 8, number: 2)
    save_new_transactor!(month: 11, year: 1987, volume: 8, number: 3)
    save_new_transactor!(month: 1, year: 1988, volume: 8, number: 4)
    save_new_transactor!(month: 3, year: 1988, volume: 8, number: 5)
    save_new_transactor!(month: 5, year: 1988, volume: 8, number: 6)

    save_new_transactor!(month: 7, year: 1988, volume: 9, number: 1)
    save_new_transactor!(month: 12, year: 1988, volume: 9, number: 2)
    save_new_transactor!(month: 2, year: 1989, volume: 9, number: 3)
    save_new_transactor!(month: 4, year: 1989, volume: 9, number: 4)
    save_new_transactor!(month: 6, year: 1989, volume: 9, number: 5)
    save_new_transactor!(month: 8, year: 1989, volume: 9, number: 6)

    puts
    puts "#{Issue.where(magazine_id: Magazine.find_by(slug: 'transactor').id).count} Transactors."
  end
end

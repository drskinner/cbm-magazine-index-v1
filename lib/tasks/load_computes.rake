# frozen_string_literal: true

require 'rake'

def save_new_compute!(month:, year:, volume: nil, number: nil, special: nil)
  compute_id = Magazine.find_by(slug: 'compute').id
  @issue_number += 1
  print '.'

  unless Issue.where(magazine_id: compute_id, month: month, year: year).exists?    
    Issue.create!(
      magazine_id: compute_id,
      year: year,
      month: month,
      volume: volume,
      number: number,
      sequence: @issue_number,
      special: special
    )
  end
end

def create_computes!(month:, year:, volume:, number:, issues:)
  for i in 0..(issues-1)
    save_new_compute!(month: month+i, year: year, volume: volume, number: number+i)
  end
end

namespace :issues do
  task load_computes: :environment do
    puts "Loading issues for Compute! Magazine..."
    @issue_number = 0

    save_new_compute!(month: 9, year: 1979, volume: 1, number: 1)

    save_new_compute!(month:  1, year: 1980, volume: 2, number: 1)
    save_new_compute!(month:  3, year: 1980, volume: 2, number: 2)
    save_new_compute!(month:  5, year: 1980, volume: 2, number: 3)
    save_new_compute!(month:  7, year: 1980, volume: 2, number: 4)
    save_new_compute!(month:  9, year: 1980, volume: 2, number: 5)
    save_new_compute!(month: 11, year: 1980, volume: 2, number: 6)
    
    create_computes!(month: 1, year: 1981, volume:  3, number: 1, issues: 12) # 08 - 19
    create_computes!(month: 1, year: 1982, volume:  4, number: 1, issues: 12) # 20 - 31
    create_computes!(month: 1, year: 1983, volume:  5, number: 1, issues: 12) # 32 - 43
    create_computes!(month: 1, year: 1984, volume:  6, number: 1, issues: 12) # 44 - 55
    create_computes!(month: 1, year: 1985, volume:  7, number: 1, issues: 12) # 56 - 67
    create_computes!(month: 1, year: 1986, volume:  8, number: 1, issues: 12) # 68 - 79
    create_computes!(month: 1, year: 1987, volume:  9, number: 1, issues: 12) # 80 - 91
    create_computes!(month: 1, year: 1988, volume: 10, number: 1, issues:  4) # May 1988 ends type-ins

    puts
    puts "#{Issue.where(magazine_id: Magazine.find_by(slug: 'compute').id).count} Compute! Magazines."
  end
end

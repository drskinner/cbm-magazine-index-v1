# frozen_string_literal: true

require 'rake'

def save_new_run!(month:, year:, volume: nil, number: nil, special: nil)
  run_id = Magazine.find_by(slug: 'run').id
  @issue_number += 1
  print '.'

  unless Issue.where(magazine_id: run_id, month: month, year: year).exists?
    Issue.create!(
      magazine_id: run_id,
      year: year,
      month: month,
      volume: volume,
      number: number,
      sequence: @issue_number,
      special: special
    )
  end
end

def create_runs!(month:, year:, volume:, number:, issues:)
  for i in 0..(issues-1)
    save_new_run!(month: month+i, year: year, volume: volume, number: number+i)
  end
end

namespace :issues do
  task load_runs: :environment do
    puts "Loading issues for RUN Magazine..."
    @issue_number = 0

    create_runs!(month: 1, year: 1984, volume: 1, number: 1, issues: 12)
    create_runs!(month: 1, year: 1985, volume: 2, number: 1, issues: 12)
    create_runs!(month: 1, year: 1986, volume: 3, number: 1, issues: 12)
    create_runs!(month: 1, year: 1987, volume: 4, number: 1, issues: 12)
    create_runs!(month: 1, year: 1988, volume: 5, number: 1, issues: 12)
    create_runs!(month: 1, year: 1989, volume: 6, number: 1, issues: 12)

    create_runs!(month: 1, year: 1990, volume: 7, number: 1, issues: 6)
    save_new_run!(month: 8, year: 1990, volume: 7, number: 7)
    create_runs!(month: 10, year: 1990, volume: 7, number: 8, issues: 3)

    save_new_run!(month: 1, year: 1991, volume: 8, number: 1)
    save_new_run!(month: 3, year: 1991, volume: 8, number: 2)
    save_new_run!(month: 5, year: 1991, volume: 8, number: 3)
    save_new_run!(month: 7, year: 1991, volume: 8, number: 4)
    save_new_run!(month: 9, year: 1991, volume: 8, number: 5)
    save_new_run!(month: 11, year: 1991, volume: 8, number: 6)    

    save_new_run!(month: 1, year: 1992, volume: 9, number: 1)
    save_new_run!(month: 3, year: 1992, volume: 9, number: 2)
    save_new_run!(month: 5, year: 1992, volume: 9, number: 3)
    save_new_run!(month: 7, year: 1992, volume: 9, number: 4)
    save_new_run!(month: 9, year: 1992, volume: 9, number: 5)
    save_new_run!(month: 11, year: 1992, volume: 9, number: 6)    
    
    puts
    puts "#{Issue.where(magazine_id: Magazine.find_by(slug: 'run').id).count} RUN Magazines."
  end
end

# frozen_string_literal: true

require 'rake'

def save_new_ahoy!(month:, year:, volume: nil, number: nil, special: nil)
  ahoy_id = Magazine.find_by(slug: 'ahoy').id
  @issue_number += 1
  print '.'

  unless Issue.where(magazine_id: ahoy_id, month: month, year: year).exists?    
    Issue.create!(
      magazine_id: ahoy_id,
      year: year,
      month: month,
      volume: volume,
      number: number,
      sequence: @issue_number,
      special: special
    )
  end
end

def create_ahoys!(month:, year:, issues:)
  for i in 0..(issues-1)
    save_new_ahoy!(month: month+i, year: year)
  end
end

namespace :issues do
  task load_ahoys: :environment do
    puts "Loading issues for Ahoy!..."
    @issue_number = 0

    create_ahoys!(month: 1, year: 1984, issues: 12)
    create_ahoys!(month: 1, year: 1985, issues: 12)
    create_ahoys!(month: 1, year: 1986, issues: 12)
    create_ahoys!(month: 1, year: 1987, issues: 12)
    create_ahoys!(month: 1, year: 1988, issues: 12)
    create_ahoys!(month: 1, year: 1989, issues: 1) 
    
    puts
    puts "#{Issue.where(magazine_id: Magazine.find_by(slug: 'ahoy').id).count} Ahoy! magazines."
  end
end

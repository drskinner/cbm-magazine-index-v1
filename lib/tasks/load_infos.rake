# frozen_string_literal: true

require 'rake'

def save_new_info!(month:, year:, volume: nil, number: nil, special: nil)
  info_id = Magazine.find_by(slug: 'info').id
  @issue_number += 1
  print '.'

  unless Issue.where(magazine_id: info_id, sequence: @issue_number).exists?
    Issue.create!(
      magazine_id: info_id,
      year: year,
      month: month,
      volume: volume,
      number: number,
      sequence: @issue_number,
      special: special
    )
  end
end

def create_infos!(month:, year:, volume:, number:, issues:)
  for i in 0..(issues-1)
    save_new_info!(month: month+i, year: year, volume: volume, number: number+i)
  end
end

namespace :issues do
  task load_infos: :environment do
    puts "Loading issues for Info..."
    @issue_number = 0

    save_new_info!(month: 9, year: 1983, special: 'Fall 1983') # 01
    save_new_info!(month: 12, year: 1983, special: 'Winter 1983/1984')
    save_new_info!(month: 3, year: 1984, special: 'Spring 1984')
    save_new_info!(month: nil, year: 1984)
    save_new_info!(month: nil, year: 1984)

    save_new_info!(month: nil, year: 1985) # 06
    save_new_info!(month: 6, year: 1985)
    save_new_info!(month: 9, year: 1985)
    save_new_info!(month: 12, year: 1985)
    
    save_new_info!(month: 5, year: 1986) # 10
    save_new_info!(month: 8, year: 1986)
    save_new_info!(month: 11, year: 1986)
    
    save_new_info!(month: 1, year: 1987) # 13
    save_new_info!(month: 3, year: 1987, special: 'Spring/Summer 1987')
    save_new_info!(month: 7, year: 1987)
    save_new_info!(month: 9, year: 1987)
    save_new_info!(month: 11, year: 1987)

    save_new_info!(month: 1, year: 1988) # 18
    save_new_info!(month: 3, year: 1988)
    save_new_info!(month: 5, year: 1988)
    save_new_info!(month: 7, year: 1988)
    save_new_info!(month: 9, year: 1988)
    save_new_info!(month: 11, year: 1988)

    save_new_info!(month: 1, year: 1989) # 24
    save_new_info!(month: 3, year: 1989)
    save_new_info!(month: 5, year: 1989)
    save_new_info!(month: 7, year: 1989)
    save_new_info!(month: 9, year: 1989)
    save_new_info!(month: 11, year: 1989)

    save_new_info!(month: 1, year: 1990) # 30
    save_new_info!(month: 3, year: 1990)

    puts
    puts "#{Issue.where(magazine_id: Magazine.find_by(slug: 'info').id).count} Info magazines."
  end
end

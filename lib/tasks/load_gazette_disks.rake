# frozen_string_literal: true

require 'rake'

def save_new_disk!(month:, year:, volume: nil, number: nil, special: nil)
  disk_id = Magazine.find_by(slug: 'gazette_disk').id
  @issue_number += 1
  print '.'

  unless Issue.where(magazine_id: disk_id, month: month, year: year).exists?    
    Issue.create!(
      magazine_id: disk_id,
      year: year,
      month: month,
      volume: volume,
      number: number,
      sequence: @issue_number,
      special: special
    )
  end
end

def create_disks!(month:, year:, volume:, number:, issues:)
  for i in 0..(issues-1)
    save_new_disk!(month: month+i, year: year)
  end
end

namespace :issues do
  task load_gazette_disks: :environment do
    puts "Loading issues for Compute!'s Gazette Special Disk..."
    @issue_number = 0

    create_disks!(month: 1, year: 1994, volume: nil, number: nil, issues: 12)
    create_disks!(month: 1, year: 1995, volume: nil, number: nil, issues: 2)
    
    puts
    puts "#{Issue.where(magazine_id: Magazine.find_by(slug: 'gazette_disk').id).count} Gazette Disks."
  end
end

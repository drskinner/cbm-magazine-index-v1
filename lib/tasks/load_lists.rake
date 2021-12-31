# frozen_string_literal: true

require 'rake'

namespace :lists do
  task seed_all: :environment do
    puts "Seeding lists for article classification..."
    @position_number = 0

    print "Seeding languages: "
    ['BASIC', 'ML', 'BASIC/ML Hybrid', 'C', 'COMAL', 'FORTH', 'LOGO', 'Pascal', 'PILOT'].each do |l|
      @position_number += 1
      print '.'
      unless Language.find_by(name: l)
        Language.create!(
          name: l,
          position: @position_number
        )
      end
    end
    puts
    puts "#{Language.count} languages in DB."

    @position_number = 0

    print "Seeding machines: "
    ['64', '128', 'VIC-20', 'PET/CBM', 'Plus/4', '16', 'KIM-1', 'CBM-II', 'PC'].each do |m|
      @position_number += 1
      print '.'
      unless Machine.find_by(name: m)
        Machine.create!(
          name: m,
          position: @position_number
        )
      end
    end
    puts
    puts "#{Machine.count} machines in DB."

    @position_number = 0

    print "Seeding classification types: "
    ['Article',
     'Regular Feature',
     'Type-In',
     'Review - Hardware',
     'Review - Software',
     'Review - Book'].each do |c|
      @position_number += 1
      print '.'
      unless Classification.find_by(name: c)
        Classification.create!(
          name: c,
          position: @position_number
        )
      end
    end
    puts
    puts "#{Classification.count} classification types in DB."

    @position_number = 0

    print "Seeding tags: "
    [
      'games', 'disk utilities', 'programming', 'word processors', 'spreadsheets', 'GEOS', 'databases',
      'input devices', 'display hardware', 'modems', 'printers', 'disk drives', 'datasettes',
      'graphics', 'sprites', 'fonts/charsets', 'PETSCII', 'text', 'multicolor', 'telecommunications',
      'publishing', 'hardware mods', 'repairs', 'hardware projects', 'sound', 'music', 'MIDI',
      'SID', 'VIC-II', 'education', 'CMD', 'piracy', 'hi-res'
    ].each do |t|
      print '.'
      unless Tag.find_by(name: t)
        Tag.create!(
          name: t,
          alpha_guide: t.downcase
        )
      end
    end
    puts
    puts "#{Tag.count} subject tags in DB."
  end
end

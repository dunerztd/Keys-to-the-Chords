require 'musique'
require 'artii'
require 'colorize'

$major = [
  {
    name: 'C Major',
    chords:
        [
          'C', 'Dm', 'Em', 'F', 'G', 'Am', 'Bdim'
        ]
  },
  {
    name: 'C Sharp Major',
    chords:
      [
        'C#', 'D#m', 'E#m', 'F#', 'G#', 'A#m', 'B#dim'
      ]
  },
  {
    name: 'D Major',
    chords:
      [
        'D', 'Em', 'F#m', 'G', 'A', 'Bm', 'C#dim'
      ]
  },
  {
    name: 'D Sharp Major',
    chords:
      [
        'D#', 'Fm', 'Gm', 'G#', 'A#', 'Cm', 'Ddim'
      ]
  },
  {
    name: 'E Major',
    chords:
      [
        'E', 'F#m', 'G#m', 'A', 'B', 'C#m', 'D#dim'
      ]
  },
  {
    name: 'F Major',
    chords:
      [
        'F', 'Gm', 'Am', 'A#', 'C', 'Dm', 'Edim'
      ]
  },
  {
    name: 'F Sharp Major',
    chords:
      [
        'F#', 'G#m', 'A#m', 'B', 'C#', 'D#m', 'E#dim'
      ]
  },
  {
    name: 'G Major',
    chords:
      [
        'G', 'Am', 'Bm', 'C', 'D', 'Em', 'F#dim'
      ]
  },
  {
    name: 'G Sharp Major',
    chords:
    [
      'G#', 'A#m', 'Cm', 'C#', 'D#', 'Fm', 'Gdim'
    ]
  },
  {
    name: 'A Major',
    chords:
    [
      'A', 'Bm', 'C#m', 'D', 'E', 'F#m', 'G#dim'
    ]
  },
  {
    name: 'B Flat Major',
    chords:
    [
      'Bb', 'Cm', 'Dm', 'Eb', 'F', 'Gm', 'Adim'
    ]
  },
  {
    name: 'B Major',
    chords:
    [
      'B', 'C#m', 'D#m', 'E', 'F#', 'G#m', 'A#dim'
    ]
  }
]

$minor = [
  {
    name: 'C Minor',
    chords:
    [
      'Cm', 'Ddim', 'Eb', 'Fm', 'Gm', 'Ab', 'Bb' 
    ]
  },
  {
    name: 'C Sharp Minor',
    chords:
    [
      'C#m', 'D#dim', 'E', 'F#m', 'G#m', 'A', 'B'
    ]
  },
  {
    name: 'D Minor',
    chords:
    [
      'Dm', 'Edim', 'F', 'Gm', 'Am', 'Bb', 'C'
    ]
  },
  {
    name: 'D Sharp Minor',
    chords:
    [
      'D#m', 'E#dim', 'F#', 'G#m', 'A#min', 'B', 'C#'
    ]
  },
  {
    name: 'E Minor',
    chords:
    [
      'Em', 'F#dim', 'G', 'Am', 'Bm', 'C', 'D'
    ]
  },
  {
    name: 'F Minor',
    chords:
    [
      'Fm', 'Gdim', 'Ab', 'Bbm', 'Cm', 'Db', 'Eb'
    ]
  },
  {
    name: 'F Sharp Minor',
    chords:
    [
      'F#m', 'G#dim', 'A', 'Bm', 'C#m', 'D', 'E'
    ]
  },
  {
    name: 'G Minor',
    chords:
    [
      'Gm', 'Adim', 'Bb', 'Cm', 'Dm', 'Eb', 'F'
    ]
  },
  {
    name: 'G Sharp Minor',
    chords:
    [
      'G#m', 'A#dim', 'B', 'C#m', 'D#m', 'E', 'F#'
    ]
  },
  {
    name: 'A Minor',
    chords:
    [
      'Am', 'Bdim', 'C', 'Dm', 'Em', 'F', 'G'
    ]
  },
  {
    name: 'A Sharp Minor',
    chords:
    [
      'A#min', 'B#dim', 'C#', 'D#m', 'E#m', 'F#', 'G#'
    ]
  },
  {
    name: 'B Minor',
    chords:
    [
      'Bm', 'C#dim', 'D', 'Em', 'F#m', 'G', 'A'
    ]
  }
]

def main_menu()
  while true
    puts "\n"
    puts "-" * 50
    puts "1. Search keys by chords"
    puts "2. Search keys"
    puts "3. Search chords"
    puts "4. Exit"
    puts "-" * 50
    puts "\n"
    print "Enter Selection: "
    selection = gets.chomp.to_i

    case selection
    when 1
      search_keys_by_chord()
    when 2
      search_keys()
    when 3
      search_chords()
    when 4
      puts "\n"
      puts "And where do you think you're going??"
      sleep(5)
      exit
    else
      puts "\n"
      puts "Incorrect selection. Please type 1, 2, 3 or 4"
      puts "\n"
    end
  end
end

def sub_menu
  while true
    puts "\n"
    puts "1. Select a Chord"
    puts "2. Go Back"
    puts "3. Main Menu"
    puts "\n"
    print "Enter Selection: "
    selection = gets.chomp.to_i

    case selection
    when 1
      search_chords()
    when 2
      search_keys_by_chord()
    when 3
      main_menu()
    else
      "\n"
      print "Incorrect selection. Please type 1, 2 or 3"
      "\n"
    end

  end
end

def search_chords
  puts "\n"
  print 'What chord would you like displayed (only triads (C/Cm/C#m) supported)? '
  user_entry = gets.chomp.upcase
  pattern = Regexp.new(/[ABCDEFG][#mb]?[m]?/)
  loop_test = true

  while loop_test == true
    if pattern.match(user_entry)
      puts "\n"
      p Music::Chord.new(user_entry).notes.map(&:name)
      loop_test = false
    else
      puts "\n"
      print 'Incorrect Entry. Enter a valid chord (C/C#/C#m): '
      user_entry = gets.chomp
      pattern = Regexp.new(/[ABCDEFG][#mb]?[m]?/)
      puts "\n"
    end
  end
end


def search_keys_by_chords_sub_display()
  searching = true
  while searching
    puts "\n"
    print "Which key would you like to view? "
    puts "\n"
    selection = gets.chomp

    $major.each do |n|
      if selection == n[:name]
        searching = false
        puts "\n"
        print n[:chords]
        puts "\n"
        return
      else
        $minor.each do |n|
          if selection == n[:name]
            searching = false
            puts "\n"
            print n[:chords]
            puts "\n"
            return
          end
        end
      end
    end
    puts "Incorrect Entry. Type in key exactly as it's displayed"
    puts "\n"
  end
end

def search_keys_by_chord()
  print 'Enter the chord(s) for the keys you want to find (ie. C/C#/C#m): ' # C# D Bdim
  chord_select = gets.chomp

  puts "\n"

  chord_select = chord_select.split(" ")

  # Validating user input
  pattern = Regexp.new(/[ABCDEFG][#mb]?[m]?/)
  
  loop_test = true

    chord_select.each do |chord|
      while loop_test == true
        if pattern.match(chord)
          loop_test = false
        else
          puts "\n"
          print 'Incorrect Entry. Enter a valid chord (C/C#/C#m): '
          user_entry = gets.chomp
          pattern = Regexp.new(/[ABCDEFG][#mb]?[m]?/)
          puts "\n"
          return search_keys_by_chord()
        end
      end
    end
  
  search_keys_by_chord_print(chord_select)
  
  search_keys_by_chords_sub_display()

  sub_menu()
end


def search_keys_by_chord_print(chord_select)

  found_keys = []

  $major.each do |n|
    if chord_select.all? { |c| n[:chords].include?(c) }
      puts n[:name]
      found_keys.push(n[:name])
    end
  end

  $minor.each do |n|
    if chord_select.all? { |c| n[:chords].include?(c) }
      puts n[:name]
      found_keys.push(n[:name])
    end
  end

  if found_keys.empty?
    puts "No key containing those chord(s) was found"
    main_menu()
  end
end

def search_keys
  puts "\n"
  print "What key do you want to search for? "
  selection = gets.chomp

  $major.each do |n|
    if selection == n[:name]
      puts "\n"
      puts n[:name]
      puts "\n"
      print n[:chords]
    end
  end

  $minor.each do |n|
    if selection == n[:name]
      puts "\n"
      puts n[:name]
      puts "\n"
      print n[:chords]
    end
  end
  puts "\n"
end

# search_keys_search()

main_menu()

# search_keys_by_chord()
class Library
  attr_accessor :songs, :playlist
  def initialize(songs = [], playlist = [])
    @songs = songs
    @playlist = playlist
  end
    
  def add_song(song)
    songs.push(song)
  end
  
  def add_song_to_playlist(song)
    playlist.push(song)
  end
  
  def remove_song(song)
    songs.delete(song)
  end
  
  def remove_song_from_playlist(song)
    playlist.delete(song)
  end
  
  def list_all
    songs.each do |song|
      puts "#{song.name} by #{song.artist}, 
        Mood: #{song.end_attributes[0]}, 
        Timbre: #{song.end_attributes[1]}, 
        Intensity: #{song.end_attributes[2]}, 
        Tone: #{song.end_attributes[3]}"
    end
  end
  
  def list_all_playlist
    playlist.each do |song|
      puts "#{song.name} by #{song.artist}"
    end
    puts "No matches found" if playlist.empty?
  end
  
  def check_fit(attribute_score, attribute)
    return true if
      ((attribute_score - attribute) >= -5 &&
      (attribute_score - attribute) <= 5) ||
      (attribute_score == 0)
  end
  
  def recommend
    puts "What mood score would you like to hear? (Lower numbers = Happy, Higher numbers = Dark"
    mood_score = gets.chomp.to_i
    puts "How smooth do you want it to sound? (Lower numbers = Raw, Higher numbers = Smooth"
    timbre_score = gets.chomp.to_i
    puts "How intense do you want it? (Lower numbers = Chill, Higher numbers = Intense)"
    intensity_score = gets.chomp.to_i
    puts "How balanced do you want the rhythm and melody? (Lower numbers = Rhythm-oriented, Higher numbers = Melody-oriented)"
    tone_score = gets.chomp.to_i
    songs.each do |song|
      if
        check_fit(mood_score, song.end_attributes[0]) &&
        check_fit(timbre_score, song.end_attributes[1]) &&
        check_fit(intensity_score, song.end_attributes[2]) &&
        check_fit(tone_score, song.end_attributes[3])
        add_song_to_playlist(song)
      end
    end
    list_all_playlist
  end
end

class Song
  attr_accessor :name, :artist, :attributes, :mood, :timbre, :intensity, :tone, :end_attributes, :library
  def initialize(name, artist, attributes = [], end_attributes = [], library = nil)
    @name = name
    @artist = artist
    @attributes = attributes
    @end_attributes = end_attributes
  end
    
  def rating
    puts "What would you like to rate the mood of the song?"
    mood_score = gets.chomp.to_i
    puts "What would you like to rate the timbre of the song?"
    timbre_score = gets.chomp.to_i
    puts "What would you like to rate the intensity of the song?"
    intensity_score = gets.chomp.to_i
    puts "What would you like to rate the tone of the song?"
    tone_score = gets.chomp.to_i
# EVALUATING MOOD SCORE
      attributes[0].push(mood_score) unless (mood_score == 0 || mood_score > 100)
      sum_mood = attributes[0].reduce :+
      average_mood = (sum_mood / attributes[0].count)
      end_attributes[0] = average_mood
# EVALUATING TIMBRE SCORE
      attributes[1].push(timbre_score) unless (timbre_score == 0 || timbre_score > 100)
      sum_timbre = attributes[1].reduce :+  
      average_timbre = (sum_timbre / attributes[1].count)
      end_attributes[1] = average_timbre
# EVALUATING INTENSITY SCORE
      attributes[2].push(intensity_score) unless (intensity_score == 0 || timbre_score > 100)
      sum_intensity = attributes[2].reduce :+
      average_intensity = (sum_intensity / attributes[2].count)  
      end_attributes[2] = average_intensity
# EVALUATING TONE SCORE
      attributes[3].push(tone_score) unless (tone_score == 0 || tone_score > 100)
      sum_tone = attributes[3].reduce :+
      average_tone = (sum_tone / attributes[3].count)
      end_attributes[3] = average_tone    
    puts "New score: Mood = #{average_mood}, Timbre = #{average_timbre}, Intensity = #{average_intensity}, Tone = #{average_tone}"
  end
end



# BEGIN COMMANDS AND TESTING

puts "CREATING EMPTY DATABASE AND BEGINNING POPULATING WITH SONGS"
database = Library.new
song1 = Song.new("Call of the Ktulu", "Metallica", [[65], [35], [60], [70]], [65, 35, 60, 70])
database.add_song(song1)
song2 = (Song.new("Ride The Lightning", "Metallica", [[75], [35], [75], [70]], [75, 35, 75, 70]))
database.add_song(song2)
database.add_song(Song.new("Slickleg", "Mastodon", [[80], [30], [80], [50]], [80, 30, 80, 50]))
database.add_song(Song.new("Symptom Of The Universe", "Black Sabbath", [[75], [40], [65], [50]], [75, 40, 65, 50]))
database.add_song(Song.new("Foxey Lady", "The Jimi Hendrix Experience", [[40], [50], [50], [70]], [40, 50, 50, 70]))
database.add_song(Song.new("Get Down To It", "Humble Pie", [[30], [50], [50], [60]], [30, 50, 50, 60]))
database.list_all
puts "HIGHLIGHT RIDE THE LIGHTNING'S ATTRIBUTES"
puts song2.attributes
puts "RIDE THE LIGHTNING'S ORIGINAL TIMBRE ATTRIBUTE: #{song2.attributes[1]}"
puts "TESTING NEW USER RATING"
song2.rating
puts "RIDE THE LIGHTNING'S NEW TIMBRE ATTRIBUTE (CALCULATES AVERAGE FROM): #{song2.attributes[1]}"
puts "NEW TOTAL ATTRIBUTES FOR RIDE THE LIGHTNING:"
puts song2.attributes
puts "TESTING MOOD ATTRIBUTE ONLY"
puts song2.attributes[0]
puts song2.attributes[0].count
puts "TESTING TIMBRE ATTRIBUTE ONLY"
puts song2.attributes[1]
puts song2.attributes[1].count
puts "TESTING END AVERAGES INCLUDING FIRST RATING"
puts song2.end_attributes
puts "TESTING 3RD RATING OVERALL"
song2.rating
puts "RIDE THE LIGHNING'S NEW TIMBRE ATTRIBUTE (CALCULATES AVERAGE FROM): #{song2.attributes[1]}"
puts "RIDE THE LIGHTNING'S ENTIRE ATTRIBUTES ARRAY"
puts song2.attributes
puts "TESTING RECOMMENDATION METHOD AND SHOWING RECOMMENDATION BASED OFF ENDATTRIBUTES"
database.recommend
puts "NOTE THAT USERS MAY ALSO ENTER NOTHING FOR ANY RATING AND IT WILL NOT LOWER THE FIELD'S ATTRIBUTE SCORE WHEN ENDATTRIBUTE AVERAGES ARE CALCULATED"

# OUTPUT

# CREATING EMPTY DATABASE AND BEGINNING POPULATING WITH SONGS
# Call of the Ktulu by Metallica, 
#         Mood: 65, 
#         Timbre: 35, 
#         Intensity: 60, 
#         Tone: 70
# Ride The Lightning by Metallica, 
#         Mood: 75, 
#         Timbre: 35, 
#         Intensity: 75, 
#         Tone: 70
# Slickleg by Mastodon, 
#         Mood: 80, 
#         Timbre: 30, 
#         Intensity: 80, 
#         Tone: 50
# Symptom Of The Universe by Black Sabbath, 
#         Mood: 75, 
#         Timbre: 40, 
#         Intensity: 65, 
#         Tone: 50
# Foxey Lady by The Jimi Hendrix Experience, 
#         Mood: 40, 
#         Timbre: 50, 
#         Intensity: 50, 
#         Tone: 70
# Get Down To It by Humble Pie, 
#         Mood: 30, 
#         Timbre: 50, 
#         Intensity: 50, 
#         Tone: 60
# HIGHLIGHT RIDE THE LIGHTNING'S ATTRIBUTES
# 75
# 35
# 75
# 70
# RIDE THE LIGHTNING'S ORIGINAL TIMBRE ATTRIBUTE: [35]
# TESTING NEW USER RATING
# What would you like to rate the mood of the song?
# 10
# What would you like to rate the timbre of the song?
# 10
# What would you like to rate the intensity of the song?
# 10
# What would you like to rate the tone of the song?
# 10
# New score: Mood = 42, Timbre = 22, Intensity = 42, Tone = 40
# RIDE THE LIGHTNING'S NEW TIMBRE ATTRIBUTE (CALCULATES AVERAGE FROM): [35, 10]
# NEW TOTAL ATTRIBUTES FOR RIDE THE LIGHTNING:
# 75
# 10
# 35
# 10
# 75
# 10
# 70
# 10
# TESTING MOOD ATTRIBUTE ONLY
# 75
# 10
# 2
# TESTING TIMBRE ATTRIBUTE ONLY
# 35
# 10
# 2
# TESTING END AVERAGES INCLUDING FIRST RATING
# 42
# 22
# 42
# 40
# TESTING 3RD RATING OVERALL
# What would you like to rate the mood of the song?
# 50
# What would you like to rate the timbre of the song?
# 50
# What would you like to rate the intensity of the song?
# 50
# What would you like to rate the tone of the song?
# 50
# New score: Mood = 45, Timbre = 31, Intensity = 45, Tone = 43
# RIDE THE LIGHNING'S NEW TIMBRE ATTRIBUTE (CALCULATES AVERAGE FROM): [35, 10, 50]
# RIDE THE LIGHTNING'S ENTIRE ATTRIBUTES ARRAY
# 75
# 10
# 50
# 35
# 10
# 50
# 75
# 10
# 50
# 70
# 10
# 50
# TESTING RECOMMENDATION METHOD AND SHOWING RECOMMENDATION BASED OFF ENDATTRIBUTES
# What mood score would you like to hear? (Lower numbers = Happy, Higher numbers = Dark
# 42
# How smooth do you want it to sound? (Lower numbers = Raw, Higher numbers = Smooth
# 35
# How intense do you want it? (Lower numbers = Chill, Higher numbers = Intense)
#  <-- (NO USER INPUT, REPRESENTS INACTIVE STATE ~ I.E. USER HAS NO PREFERENCE)
# How balanced do you want the rhythm and melody? (Lower numbers = Rhythm-oriented, Higher numbers = Melody-oriented)
# 43
# Ride The Lightning by Metallica
# NOTE THAT USERS MAY ALSO ENTER NOTHING FOR ANY RATING AND IT WILL NOT LOWER THE FIELD'S ATTRIBUTE SCORE WHEN ENDATTRIBUTE AVERAGES ARE CALCULATED

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
        Mood: #{song.end_attributes[:mood]}, 
        Timbre: #{song.end_attributes[:timbre]}, 
        Intensity: #{song.end_attributes[:intensity]}, 
        Tone: #{song.end_attributes[:tone]}"
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
        check_fit(mood_score, song.end_attributes[:mood]) &&
        check_fit(timbre_score, song.end_attributes[:tone]) &&
        check_fit(intensity_score, song.end_attributes[:intensity]) &&
        check_fit(tone_score, song.end_attributes[:tone])
        add_song_to_playlist(song)
      end
    end
    list_all_playlist
  end
end

class Song
  attr_accessor :name, :artist, :attributes, :mood, :timbre, :intensity, :tone, :end_attributes, :library
  def initialize(name, artist, attributes = {}, end_attributes = {}, library = nil)
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
      attributes[:mood] << (mood_score) unless (mood_score == 0 || mood_score > 100)
      sum_mood = attributes[:mood].reduce :+
      average_mood = (sum_mood / attributes[:mood].count)
      end_attributes[:mood] = average_mood
# EVALUATING TIMBRE SCORE
      attributes[:timbre] << (timbre_score) unless (timbre_score == 0 || timbre_score > 100)
      sum_timbre = attributes[:timbre].reduce :+  
      average_timbre = (sum_timbre / attributes[:timbre].count)
      end_attributes[:timbre] = average_timbre
# EVALUATING INTENSITY SCORE
      attributes[:intensity] << (intensity_score) unless (intensity_score == 0 || timbre_score > 100)
      sum_intensity = attributes[:intensity].reduce :+
      average_intensity = (sum_intensity / attributes[:intensity].count)  
      end_attributes[:intensity] = average_intensity
# EVALUATING TONE SCORE
      attributes[:tone] << (tone_score) unless (tone_score == 0 || tone_score > 100)
      sum_tone = attributes[:tone].reduce :+
      average_tone = (sum_tone / attributes[:tone].count)
      end_attributes[:tone] = average_tone    
    puts "New score: Mood = #{average_mood}, Timbre = #{average_timbre}, Intensity = #{average_intensity}, Tone = #{average_tone}"
  end
end



# BEGIN COMMANDS AND TESTING

puts "CREATING EMPTY DATABASE AND BEGINNING POPULATING WITH SONGS"
database = Library.new
song1 = Song.new("Call of the Ktulu", "Metallica", {mood: [65], timbre: [35], intensity: [60], tone: [70]}, {mood: 65, timbre: 35, intensity: 60, tone: 70})
database.add_song(song1)
song2 = Song.new("Ride The Lightning", "Metallica", {mood: [75], timbre: [35], intensity: [75], tone: [70]}, {mood: 75, timbre: 35, intensity: 75, tone: 70})
database.add_song(song2)
database.add_song(Song.new("Slickleg", "Mastodon", {mood: [80], timbre: [30], intensity: [80], tone: [50]}, {mood: 80, timbre: 30, intensity: 80, tone: 50}))
database.add_song(Song.new("Symptom Of The Universe", "Black Sabbath", {mood: [75], timbre: [40], intensity: [65], tone: [50]}, {mood: 75, timbre: 40, intensity: 65, tone: 50}))
database.add_song(Song.new("Foxey Lady", "The Jimi Hendrix Experience", {mood: [40], timbre: [50], intensity: [50], tone: [70]}, {mood: 40, timbre: 50, intensity: 50, tone: 70}))
database.add_song(Song.new("Get Down To It", "Humble Pie", {mood: [30], timbre: [50], intensity: [50], tone: [60]}, {mood: 30, timbre: 50, intensity: 50, tone: 60}))
database.list_all
puts "HIGHLIGHT RIDE THE LIGHTNING'S ATTRIBUTES"
puts song2.attributes
puts "RIDE THE LIGHTNING'S ORIGINAL TIMBRE ATTRIBUTE: #{song2.attributes[:timbre]}"
puts "TESTING NEW USER RATING"
song2.rating
puts "RIDE THE LIGHTNING'S NEW TIMBRE ATTRIBUTE (CALCULATES AVERAGE FROM): #{song2.attributes[:timbre]}"
puts "NEW TOTAL ATTRIBUTES FOR RIDE THE LIGHTNING:"
puts song2.attributes
puts "TESTING MOOD ATTRIBUTE ONLY"
puts song2.attributes[:mood]
puts song2.attributes[:mood].count
puts "TESTING TIMBRE ATTRIBUTE ONLY"
puts song2.attributes[:timbre]
puts song2.attributes[:timbre].count
puts "TESTING END AVERAGES INCLUDING FIRST RATING"
puts song2.end_attributes
puts "TESTING 3RD RATING OVERALL"
song2.rating
puts "RIDE THE LIGHTNING'S NEW TIMBRE ATTRIBUTE (CALCULATES AVERAGE FROM): #{song2.attributes[:timbre]}"
puts "RIDE THE LIGHTNING'S ENTIRE ATTRIBUTES HASH"
puts song2.attributes
puts "TESTING RECOMMENDATION METHOD AND SHOWING RECOMMENDATION BASED OFF ENDATTRIBUTES"
database.recommend


# OUTPUT

# CREATING EMPTY DATABASE AND BEGINNING POPULATING WITH SONGS
# Call of the Ktulu by Metallica, 
#        Mood: 65, 
#        Timbre: 35, 
#        Intensity: 60, 
#        Tone: 70
# Ride The Lightning by Metallica, 
#        Mood: 75, 
#        Timbre: 35, 
#        Intensity: 75, 
#        Tone: 70
# Slickleg by Mastodon, 
#        Mood: 80, 
#        Timbre: 30, 
#        Intensity: 80, 
#        Tone: 50
# Symptom Of The Universe by Black Sabbath, 
#        Mood: 75, 
#        Timbre: 40, 
#        Intensity: 65, 
#        Tone: 50
# Foxey Lady by The Jimi Hendrix Experience, 
#        Mood: 40, 
#        Timbre: 50, 
#        Intensity: 50, 
#        Tone: 70
# Get Down To It by Humble Pie, 
#        Mood: 30, 
#        Timbre: 50, 
#        Intensity: 50, 
#        Tone: 60
# HIGHLIGHT RIDE THE LIGHTNING'S ATTRIBUTES
# {:mood=>[75], :timbre=>[35], :intensity=>[75], :tone=>[70]}
# RIDE THE LIGHTNING'S ORIGINAL TIMBRE ATTRIBUTE: [35]
# TESTING NEW USER RATING
# What would you like to rate the mood of the song?
# 10
# What would you like to rate the timbre of the song?
# <-- LACK OF INPUT INDICATES USER DOESN'T WISH TO RATE THE TIMBRE
# What would you like to rate the intensity of the song?
# 10
# What would you like to rate the tone of the song?
# 10
# New score: Mood = 42, Timbre = 35, Intensity = 42, Tone = 40
# RIDE THE LIGHTNING'S NEW TIMBRE ATTRIBUTE (CALCULATES AVERAGE FROM): [35] <-- USER'S LACK OF INPUT IS NOT ADDED TO HASH (PROGRAM TREATS IT AS "0" AND DOESN'T SAVE)
# NEW TOTAL ATTRIBUTES FOR RIDE THE LIGHTNING:
# {:mood=>[75, 10], :timbre=>[35], :intensity=>[75, 10], :tone=>[70, 10]}
# TESTING MOOD ATTRIBUTE ONLY
# 75
# 10
# 2
# TESTING TIMBRE ATTRIBUTE ONLY
# 35
# 1
# TESTING END AVERAGES INCLUDING FIRST RATING
# {:mood=>42, :timbre=>35, :intensity=>42, :tone=>40}
# TESTING 3RD RATING OVERALL
# What would you like to rate the mood of the song?
# 70
# What would you like to rate the timbre of the song?
# 70
# What would you like to rate the intensity of the song?
# <-- AGAIN, LACK OF USER INPUT INDICATES USER DOESN'T WISH TO RATE THE INTENSITY (PROGRAM TREATS IT AS "0" AND DOESN'T SAVE)
# What would you like to rate the tone of the song?
# 70
# New score: Mood = 51, Timbre = 52, Intensity = 42, Tone = 50
# RIDE THE LIGHNING'S NEW TIMBRE ATTRIBUTE (CALCULATES AVERAGE FROM): [35, 70]
# RIDE THE LIGHTNING'S ENTIRE ATTRIBUTES HASH
# {:mood=>[75, 10, 70], :timbre=>[35, 70], :intensity=>[75, 10], :tone=>[70, 10, 70]}
# TESTING RECOMMENDATION METHOD AND SHOWING RECOMMENDATION BASED OFF ENDATTRIBUTES
# What mood score would you like to hear? (Lower numbers = Happy, Higher numbers = Dark
# 51
# How smooth do you want it to sound? (Lower numbers = Raw, Higher numbers = Smooth
# <-- LACK OF INPUT INDICATES USER DOESN'T HAVE A PREFERENCE FOR SMOOTHNESS IN RECOMMENDATION (RETURNS "TRUE" IN CHECK_FIT METHOD FOR ALL SONGS FOR THIS PARTICULAR ATTRIBUTE)
# How intense do you want it? (Lower numbers = Chill, Higher numbers = Intense)
# 46
# How balanced do you want the rhythm and melody? (Lower numbers = Rhythm-oriented, Higher numbers = Melody-oriented)
# 47
# Ride The Lightning by Metallica
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
        Mood: #{song.endattributes[0]}, 
        Timbre: #{song.endattributes[1]}, 
        Intensity: #{song.endattributes[2]}, 
        Tone: #{song.endattributes[3]}"
    end
  end
  
  def list_all_playlist
    playlist.each do |song|
      puts "#{song.name} by #{song.artist}"
    end
    if playlist.empty?
      puts "No matches found"
    end
  end
  
  def checkfit(attributescore, attribute)
    return true if
      ((attributescore - attribute) >= -5 &&
      (attributescore - attribute) <= 5) ||
      (attributescore == 0)
  end
  
  def recommend
    puts "What mood score would you like to hear? (Lower numbers = Happy, Higher numbers = Dark"
    moodscore = gets.chomp.to_i
    puts "How smooth do you want it to sound? (Lower numbers = Raw, Higher numbers = Smooth"
    timbrescore = gets.chomp.to_i
    puts "How intense do you want it? (Lower numbers = Chill, Higher numbers = Intense)"
    intensityscore = gets.chomp.to_i
    puts "How balanced do you want the rhythm and melody? (Lower numbers = Rhythm-oriented, Higher numbers = Melody-oriented)"
    tonescore = gets.chomp.to_i
    songs.each do |song|
      if
        checkfit(moodscore, song.endattributes[0]) &&
        checkfit(timbrescore, song.endattributes[1]) &&
        checkfit(intensityscore, song.endattributes[2]) &&
        checkfit(tonescore, song.endattributes[3])
        add_song_to_playlist(song)
      end
    end
    list_all_playlist
  end
end

class Song
  attr_accessor :name, :artist, :attributes, :mood, :timbre, :intensity, :tone, :endattributes, :library
  def initialize(name, artist, attributes = [], endattributes = [], library = nil)
    @name = name
    @artist = artist
    @attributes = attributes
    @endattributes = endattributes
  end
    
  def rating
    puts "What would you like to rate the mood of the song?"
    moodscore = gets.chomp.to_i
    puts "What would you like to rate the timbre of the song?"
    timbrescore = gets.chomp.to_i
    puts "What would you like to rate the intensity of the song?"
    intensityscore = gets.chomp.to_i
    puts "What would you like to rate the tone of the song?"
    tonescore = gets.chomp.to_i
# EVALUATING MOOD SCORE
      attributes[0].push(moodscore) unless (moodscore == 0)
      summood = attributes[0].reduce :+
      averagemood = (summood / attributes[0].count)
      endattributes[0] = averagemood
# EVALUATING TIMBRE SCORE
      attributes[1].push(timbrescore) unless (timbrescore == 0)
      sumtimbre = attributes[1].reduce :+  
      averagetimbre = (sumtimbre / attributes[1].count)
      endattributes[1] = averagetimbre
# EVALUATING INTENSITY SCORE
      attributes[2].push(intensityscore) unless (intensityscore == 0)
      sumintensity = attributes[2].reduce :+
      averageintensity = (sumintensity / attributes[2].count)  
      endattributes[2] = averageintensity
# EVALUATING TONE SCORE
      attributes[3].push(tonescore) unless (tonescore == 0)
      sumtone = attributes[3].reduce :+
      averagetone = (sumtone / attributes[3].count)
      endattributes[3] = averagetone    
    puts "New score: Mood = #{averagemood}, Timbre = #{averagetimbre}, Intensity = #{averageintensity}, Tone = #{averagetone}"
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
puts song2.endattributes
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
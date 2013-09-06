require './musicrecommendation'

describe Library do
  before(:each) do
    @library = Library.new([], [])
    @song = Song.new('songname', 'artistname', [[10, 20], [30, 40], [50, 60], [70, 80]], [15, 35, 55, 75])
  end

  it "should add a song to the library" do
    @library.songs.push(@song)
    @library.songs[0].should == @song
  end
  
  it "should recommend a song if user input is + or - 5 attribute points of end attribute averages" do
    def checkfit
      mood_score = 20
      return true if
        ((mood_score - @song.end_attributes[0]) >= -5 &&
        (mood_score - @song.end_attributes[0]) <= 5) ||
        (mood_score == 0)
      end
    checkfit.should == true
  end
  
  it "should add recommended song to the user's playlist" do
     @library.playlist.push(@song)
     @library.playlist[0].should == @song
  end
  
  it "should be able to recall data about each song in the library" do
    @library.songs.push(@song)
    @library.songs.each do |song|
      info = "#{song.name} by #{song.artist}, 
        Mood: #{song.end_attributes[0]}, 
        Timbre: #{song.end_attributes[1]}, 
        Intensity: #{song.end_attributes[2]}, 
        Tone: #{song.end_attributes[3]}"
      info.should == "songname by artistname, 
        Mood: 15, 
        Timbre: 35, 
        Intensity: 55, 
        Tone: 75"
      puts info
    end
  end
  
  it "should be able to recall data about each song in the user's recommended playlist" do    
    puts "No matches found" if @library.playlist.empty?
    @library.playlist.push(@song)
    @library.playlist.each do |song|
      info = "#{song.name} by #{song.artist}"
    info.should == "songname by artistname"
    puts info
    end
  end
  
end
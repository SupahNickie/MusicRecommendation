require './main'

describe Library do
  before(:each) do
    @library = Library.new([], [])
    @song = Song.new('songname', 'artistname', {mood: [10, 20], timbre: [30, 40], intensity: [50, 60], tone: [70, 80]}, {mood: 15, timbre: 35, intensity: 55, tone: 75})
  end

  it "should add and remove a song to the library" do
    # Add song
      @library.songs.push(@song)
      @library.songs[0].should == @song
    # Remove song
      @library.songs.delete(@song)
      @library.songs[0].should == nil
  end
  
  it "should recommend a song if user input is + or - 5 attribute points of end attribute averages" do
    def checkfit
      mood_score = 20
      return true if
        ((mood_score - @song.end_attributes[:mood]) >= -5 &&
        (mood_score - @song.end_attributes[:mood]) <= 5) ||
        (mood_score == 0)
      end
    checkfit.should == true
  end
  
  it "should add and remove recommended song to the user's playlist" do
     # Add song
       @library.playlist.push(@song)
       @library.playlist[0].should == @song
     # Remove song
       @library.playlist.delete(@song)
       @library.playlist[0].should == nil
  end
  
  it "should be able to recall data about each song in the library" do
    @library.songs.push(@song)
    @library.songs.each do |song|
      info = "#{song.name} by #{song.artist}, 
        Mood: #{song.end_attributes[:mood]}, 
        Timbre: #{song.end_attributes[:timbre]}, 
        Intensity: #{song.end_attributes[:intensity]}, 
        Tone: #{song.end_attributes[:tone]}"
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

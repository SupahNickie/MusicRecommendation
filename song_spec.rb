require './main'

describe Song do
  before(:each) do
    @song = Song.new('songname', 'artistname', {mood: [10, 20], timbre: [30, 40], intensity: [50, 60], tone: [70, 80]}, {mood: 15, timbre: 35, intensity: 55, tone: 75})
  end

  it "should return more than one value for each attribute" do
    @song.attributes[:mood].should == [10, 20]
  end
  
  it "should change the averages after a user rating" do
    mood_score = 30
      @song.attributes[:mood] << (mood_score)
      sum_mood = @song.attributes[:mood].reduce :+
      average_mood = (sum_mood / @song.attributes[:mood].count)
      @song.end_attributes[:mood] = average_mood
    @song.end_attributes[:mood].should == 20
  end
  
end

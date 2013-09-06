require './musicrecommendation'

describe Song do
  before(:each) do
    @song = Song.new('songname', 'artistname', [[10, 20], [30, 40], [50, 60], [70, 80]], [15, 35, 55, 75])
  end

  it "should return more than one value for each attribute" do
    @song.attributes[0].should == [10, 20]
  end
  
  it "should change the averages after a user rating" do
    mood_score = 30
      @song.attributes[0].push(mood_score)
      sum_mood = @song.attributes[0].reduce :+
      average_mood = (sum_mood / @song.attributes[0].count)
      @song.end_attributes[0] = average_mood
    @song.end_attributes[0].should == 20
  end
  
end


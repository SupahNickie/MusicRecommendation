The idea for this app is to create a new music service to compete with the likes of Pandora and Spotify, but for a more niche clientele: those who
are hardcore music appreciators. Everybody has their favorite artist or genre, but I'm looking to take aim at people who are more than that, who are
not afraid to explore all kinds of music regardless of genre. 

Rather than focus on the particular artist or musical stylings, I've created a recommendation service based on four qualities that can be numerically
quantified on a scale: Mood, Timbre, Intensity, and Tone. I believe that these four SUBJECTIVE qualities can serve as the backbone for allowing music
lovers to experiment with new kinds of musical experiences they've never thought to try before. With a numerical score of 50 representing completely
average or neutral, the definitions of the scores are as follows:

Mood - Light to Dark; how "evil" or "happy" does a song sound?
Timbre - Smooth to Raw; how grating is the sound to the ears? Michael Buble is NOT going to be in the same park as Cannibal Corpse.
Intensity - Backgroundy to Oppressive; how "up-front" and "in your face" is the music? A song with a lower score could be thrown on in the background
while one does chores and be unintrusive while a score of 100 would leave the user breathless and unable to focus on anything but the song.
Tone - Rhythmic to Melodic; what's the balance between rhythm and melody in the song? More melodious singer-songwriter types would score higher than a
rhythm-centric Djembe tribal group for example.

In defining music by these four qualities, users can experience songs and artists, even whole genres they never would have thought to try beforehand.
Here's a sample use-case scenario:

User X wants to listen to something quite dark and with low intensity; he does not have a preference for timbre or the tone balance. A search reveals
(among others of course) these three songs to him:



"Mitosis" by Anomalous (off the album Ohmnivalent) - http://www.youtube.com/watch?v=_bT_lxoUF7c

"Acceptance" by Akira Yamaoka feat. Mary Elizabeth McGlynn (off the album Silent Hill: Shattered Memories) - http://www.youtube.com/watch?v=93RT0VTIphI

"Symphony No.3 Op.36, Movement 1" by Henryk Gorecki - http://www.youtube.com/watch?v=XXkuF5XOEm0



Trying these three songs out, you can hear how similar they are in the overall subjective "feel" of the piece, though the band Anomalous is a self-
proclaimed "brutal technical death metal" act from San Francisco, Akira Yamaoka is best known for his pioneering work in the Konami video game series 
"Silent Hill", where he blends soundscapes with hip-hop inspired drum beats to create unsettling scores, and Henryk Gorecki's 3rd Symphony is a 
masterpiece of melancholy written in the mid-1970s. These three pieces of music have as little to do with each other in terms of genre and artist 
"relationships" as possible. Searching "Anomalous" on Pandora WOULD NOT throw these two songs into a playlist for User X, even though this is the
type of music he wants to listen to; instead, he would get a slew of death metal.

Individual songs are what make up an artists repertoire, not a particular album or even decade. Of course, some artists are more unidirectional than
others, but a perfect case would be the iconic group Metallica. Their career spans 30+ years and the vast range they cover would make it difficult for
a music database to really be able to accurately base recommendations based on mood by just using the input "Metallica". Does the user mean the Metallica
that wrote the song "Nothing Else Matters" and "Mama Said"? Or... does the user mean the Metallica that wrote "Dyer's Eve" and "Damage Inc."? This type
of recommendation service would ameliorate those issues.

That being said, the code I provide in this repository illustrates the backbone that could power such an appplication, though I so far lack the
experience and knowledge yet to implement this code in a web-friendly framework. Also, this application relies upon a broad musical database with these
four attributes individually assigned to each song, which would be quite a feat to accomplish. However, this also opens the door for User feedback as well;
I've included the methods necessary for users to be able to submit their own ratings for each song, which are then added to the attributes arrays for each
song's "feel" scores for use in calculating the end attribute scores that users actually search by. By encouraging users to rate the songs, each submission
would increase the overall accuracy of each score, thus making the database that much more accurate with each user score report.

Please feel free to contact me at nicholascase@live.com with any comments or questions! Thanks for taking a look at my code.

-Nicholas Case

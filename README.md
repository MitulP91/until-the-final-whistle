## Project Name: Until The Final Whistle 
## Mitul Patel

## Heroku URL:
	- (not yet made) www.untilthefinalwhistle.herokuapp.com
## Github URL:
	- 

###################
## PURPOSE/SCOPE ##
###################

I'm planning to build an application that acts as a sort of one-stop-shop for soccer news, team information (statistics, schedules, etc.), twitter feeds, and possibly links to merchandise purchasing. I decided to do this because I currently have to access at least four to five different websites to get all of my current soccer needs.

I am looking at implementing a myriad of features. I want to be able to have users login and view general soccer news or select specific teams and see news related to that team. When they click on that team they should also be able to see upcoming games, past results, and where they can go to look for tickets to upcoming games. This page should also show some general statistics for each team. The app should also display the twitter feeds of all the players on that specific team. I also want to implement a favorite option where users can select their favorite teams and have them easily accessible. Each one of these team pages will have a roster of players which link to player pages. These player pages will have specific statistics.

For the week timeframe in which I will currently be working, I have decided to restrict myself to only the English Premier League (EPL) and to focus mainly on retrieving the news and twitter feeds for each team and possibly individual players (depending on Twitter's API). I will also display basic statistics for each team. Again, if time permits I will also do this for individual players (and if Stats FC API permits). The news options should be fully operational for each team. 

###############
## RESOURCES ##
###############

APIs/Widgets:

	Stats FC API:
		This API will allow me to pull statistics and results for each team and also pull general information like top scorers in the league. 

		URL: https://statsfc.com/docs/api

	Google RSS Feed:
		This will allow me to pull article titles and URL's using each team name as a search parameter. 

		URL: https://news.google.com/news/feeds?q=*** Enter Search Params Here ***&output=rss

	Twitter API/Widgets:
		I may or may not use this API depending on how far I get with the scope of my project. Ideally, I will use this API to create lists for each team that consists of the twitter feeds of each of the players on the team and the team's official twitter feed. Otherwise, I will just use the twitter widgets to manually insert the players twitter feeds on their individual player pages


Gems:

	Rails 3.2.13:
		This is the version of Rails I'll be using.

	PG:
		I'll be using PostgreSQL because it is a good DBMS.

	HTTParty:
		I'll be using this gem to parse the XML or JSON from the APIs listed above.

	Rspec-Rails:
		I'll be developing this with TDD therefore I require rspec for rails.


Other Tech:
	Heroku:
		This site will be hosted on Heroku for the time being.


##################
## USER STORIES ##
##################
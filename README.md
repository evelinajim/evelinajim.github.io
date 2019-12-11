# Sentiment Analysis That Detects Aggressive Speech  
This is the repository of the AggressiveSpeech Detection tool. Essentially this tool gathers the 1000 most recent tweets that are found using the indicated keyword, it then reformats the tweet so that extra components such as ‘rt’ and irrelevant @s are removed, produces a WordCloud, and produces the sentiment analysis ggplot. 

# Built with 
* R & RStudio
* if you do not have the packages in the R program, install using: install.packages('name of package')

## Running the Program
* sentiment analysis.R will do the work for you. All you'll need to do is authenticate your twitter credentials and then changethe parameters:

tweets_i <- searchTwitter("SEARCHWORDHERE", n=1000,lang = "en")

* you may also change the number of tweets extracted by replacing the 1000
* language is also easy to change by changing the en.

# Changing the dataset
Once again, this tool makes it easy to perform sentiment analysis. In lin 72 change the 'get_nrc_sentiment' to the dataset that you want to filter the text with. 
mysentiment_illegals<-get_nrc_sentiment((illegals_text))

* A good one to use for example is this one [Cyber Aggression Dataset](https://dataturks.com/projects/abhishek.narayanan/Dataset%20for%20Detection%20of%20Cyber-Trolls)

# Find the Files 
[Detection Tool Files](https://github.com/evelinajim/evelinajim.github.io)


# Old
This tool is capable of entering a twitter @ and producing a score on how aggressive their speech is based on their last 100 tweets. It will also conjure up a csv file for which tweets were detected as aggressive for further analyzation by the user. 
## Old Methods
* [tweepy](https://www.tweepy.org/)- web framework to access twitter APi
* [twitterAPI](https://developer.twitter.com/) - twitter api
* [textblob](https://textblob.readthedocs.io/en/dev/) - sentimate analysis 
## Running the Program
On a command line you reference the downloaded files by cding to the file location. Then you will reference the file and write the @ without the @ sign in it. The program will then recieve 100 tweets and the trained module will filter the aggressive tweets into a new array.

```
analysis.py twitterusername
```

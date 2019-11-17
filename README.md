# evelinajim.github.io

# Sentiment Analysis That Detects Aggressive Speech  
This is the repository of the AggressiveSpeech Detection tool. This tool is capable of entering a twitter @ and producing a score on how aggressive their speech is based on their last 100 tweets. It will also conjure up a csv file for which tweets were detected as aggressive for further analyzation by the user. 

# Built with 

* [tweepy](https://www.tweepy.org/)- web framework to access twitter APi
* [twitterAPI](https://developer.twitter.com/) - twitter api
* [textblob](https://textblob.readthedocs.io/en/dev/) - sentimate analysis 

# Running the Program
On a command line you reference the downloaded files by cding to the file location. Then you will reference the file and write the @ without the @ sign in it. The program will then recieve 100 tweets and the trained module will filter the aggressive tweets into a new array.

```
analysis.py twitterusername
```

# Issues
Currently the analysis.py is going through revision

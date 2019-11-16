# -*- coding: utf-8 -*-
"""
Created on Sun Nov 10 05:16:29 2019

@author: Eve Jimenez Sagastegui
"""

import sys
import csv
import tweepy

#Twitter API credentials
consumer_key = "7kXfYSi8uytkTzS4ryKsHDiNk"
consumer_secret = "P5LFedTv9BuKNZBQJ7HmML13GJB6xD9WpcnvwPt6131bK2MSsf"
access_key = "3207440284-GydAGF8Iv1Y4rmDikH4ryH9Qo1KrKBAMZKCfybq"
access_secret = "wi4R06NNP8SSCrHYAOkCEMsb3KMgSFJ63nLTiMYrYzvpY"

#latest tweet method
def storingtweets(username):
	auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
	auth.set_access_token(access_key, access_secret)
	api = tweepy.API(auth)
	numtweets = 100 #can be changed 

	tweets_csv = []
	for tweet in tweepy.Cursor(api.user_timeline, screen_name = username).items(numtweets):
        #can be changed to account for different material wanted
        #currently: array of twitter username, tweet id (tweet.id_str), date and time, tweet #ADD THIS ITS IMPORTATNT
		tweets_csv.append([username, tweet.created_at, tweet.text.encode("utf-8")])
    #puts twitter user information into a csv
	outfile = username + "_recent_tweets.csv"
	with open(outfile, 'w+') as file:
		writer = csv.writer(file, delimiter=',')
		writer.writerows(tweets_csv)

#gets usernames tweets
if __name__ == '__main__':

    
    if len(sys.argv) == 2:
        storingtweets(sys.argv[1])
    else:
        print("Error: Enter at least one username")

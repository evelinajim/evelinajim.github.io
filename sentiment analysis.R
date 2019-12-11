library("NLP")
library("twitteR")
library("syuzhet")
library("SnowballC")
library("stringi")
library("topicmodels")
library("ROAuth")

#Authentication of twitter API
consumer_key <- 'consumer key'
consumer_secret <- 'consumer secret'
access_token <- 'token'
access_secret <- 'secret'
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

#put in the hashtag you want twitter to search for
tweets_i <- searchTwitter("#illegals", n=1000,lang = "en")
tweets_u <- searchTwitter("#undocumented", n=1000,lang = "en")

illegals_tweets <- twListToDF(tweets_i)
undocumented_tweets <- twListToDF(tweets_u)


illegals_text<- illegals_tweets$text
undocumented_text<- undocumented_tweets$text

### CLEANING UP TEXT ###
illegals_text<- tolower(illegals_text)
undocumented_text<- tolower(undocumented_text)

# Replaces blank space ("rt")
illegals_text <- gsub("rt", "", illegals_text)
undocumented_text <- gsub("rt", "", undocumented_text)

# Replaces userName
illegals_text <- gsub("@\\w+", "", illegals_text)
undocumented_text <- gsub("@\\w+", "", undocumented_text)

# Removes punctuation
illegals_text <- gsub("[[:punct:]]", "", illegals_text)
undocumented_text <- gsub("[[:punct:]]", "", undocumented_text)

# Removes links
illegals_text <- gsub("http\\w+", "", illegals_text)
undocumented_text <- gsub("http\\w+", "", undocumented_text)

# Removes tabs
illegals_text <- gsub("[ |\t]{2,}", "", illegals_text)
undocumented_text <- gsub("[ |\t]{2,}", "", undocumented_text)

# Removes blank spaces at start
illegals_text <- gsub("^ ", "", illegals_text)
undocumented_text <- gsub("^ ", "", undocumented_text)

# Removes blank spaces at  end
illegals_text <- gsub(" $", "", illegals_text)
undocumented_text <- gsub(" $", "", undocumented_text)

library("tm")
illegals_tweets.text.corpus <- Corpus(VectorSource(illegals_text))
undocumented_tweets.text.corpus <- Corpus(VectorSource(undocumented_text))

#remove stop words
illegals_tweets.text.corpus <- tm_map(illegals_tweets.text.corpus, function(x)removeWords(x,stopwords()))
undocumented_tweets.text.corpus <- tm_map(undocumented_tweets.text.corpus, function(x)removeWords(x,stopwords()))

### CREATE WORDCLOUD ###
library("wordcloud")
wordcloud(illegals_tweets.text.corpus,min.freq = 40,colors=brewer.pal(8, "Dark2"),random.color = TRUE,max.words = 100)
wordcloud(undocumented_tweets.text.corpus,min.freq = 10,colors=brewer.pal(8, "Dark2"),random.color = TRUE,max.words = 500)

### SENTIMENT ANALYSIS ###
mysentiment_illegals<-get_nrc_sentiment((illegals_text))
mysentiment_undocumented<-get_nrc_sentiment((undocumented_text))

#calculates total score for each sentiment
Sentimentscores_illegals<-data.frame(colSums(mysentiment_illegals[,]))
Sentimentscores_undocumented<-data.frame(colSums(mysentiment_undocumented[,]))

names(Sentimentscores_illegals)<-"Score"
Sentimentscores_illegals<-cbind("sentiment"=rownames(Sentimentscores_illegals),Sentimentscores_illegals)
rownames(Sentimentscores_illegals)<-NULL

names(Sentimentscores_undocumented)<-"Score"
Sentimentscores_undocumented<-cbind("sentiment"=rownames(Sentimentscores_undocumented),Sentimentscores_undocumented)
rownames(Sentimentscores_undocumented)<-NULL

library(ggplot2)
#plotting sentiments with scores
ggplot(data=Sentimentscores_illegals,aes(x=sentiment,y=Score))+geom_bar(aes(fill=sentiment),stat = "identity")+
  theme(legend.position="none")+
  xlab("Sentiments")+ylab("scores")+ggtitle("Sentiments of people behind tweets with the #illegals")


ggplot(data=Sentimentscores_undocumented,aes(x=sentiment,y=Score))+geom_bar(aes(fill=sentiment),stat = "identity")+
  theme(legend.position="none")+
  xlab("Sentiments")+ylab("scores")+ggtitle("Sentiments of people behind tweets with the #undocumented")


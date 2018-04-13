#twiiter analytics

install.packages("twitteR")
install.packages("ROAuth")
install.packages("RCurl")
library("twitteR")
library("ROAuth")
library("RCurl")
# Download "cacert.pem" file
download.file(url="http://curl.haxx.se/ca/cacert.pem",destfile="cacert.pem")

#create an object "cred" that will save the authenticated object that we can use for later sessions
twitCred <- OAuthFactory$new(consumerKey='NOST8Ekho2CbUe2ttMCABFIhb',
                         consumerSecret='	F4f1zpGcyAurQzK2V4Wfn4qITbnwJ5DQt7d1f5nTF4RnIfh9qz
',  requestURL='http://api.twitter.com/oauth/request_token', accessURL='http://api.twitter.com/oauth/access_token', authURL='http://api.twitter.com/oauth/authorize')


# Executing the next step generates an output --> To enable the connection, please direct your web browser to: <hyperlink> . Note:  You only need to do this part once

twitCred$handshake(cainfo= system.file("CurlSSL","cacert.pem", package = "RCurl")
                   #save for later use for Windows
                   save(cred, file="twitter authentication.Rdata")                   
                   
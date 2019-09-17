score_sentiment<-function(df){
# Arguments: dataframe with one column: review/optinion        
# output: a dataframe with the sentiment scores for the respected rows of the dataframe

  library(sentimentr)
  out<-vector()
  n<-nrow(df)
  names(df)<-"review"
  if(n>0){
     for(i in 1:n){
                   review<-gsub("_"," ",as.character(df$review[i]))
                   score<-mean(sentiment(review)$sentiment)
                   out<-append(out,score)
     }
     df$sentiment<-out
  }
  return(df)
}

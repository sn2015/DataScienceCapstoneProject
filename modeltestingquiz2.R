
source("clean.R")


phrase <- "The guy in front of me just bought a pound of bacon, a bouquet, and a case of"
phrase <- clean(phrase)
rm(cleanedset, clean)

final[final$word1 %in% c("beer", "soda", "pretzels", "cheese"), ]
# word3 word2    word1           p3
# 492      a  case     beer 5.437931e-06
# 985      a  case   cheese 2.800534e-06
# 3325     a  case     soda 9.108534e-07
# 9641     a  case pretzels 2.718965e-07



# 2. 
phrase <- "You're the reason why I smile everyday. Can you follow me please? It would mean the"
phrase <- clean(phrase)
final[final$word1 %in% c("universe", "world", "most", "best"), ]
# word3 word2    word1           p3
# 695  would  mean     best 3.922928e-06 "wrong"
# 716  would  mean     most 3.232581e-06
# 736  would  mean    world 2.964112e-06
# 3879 would  mean universe 3.287370e-07




# 3
phrase <- "Hey sunshine, can you follow me and make me the"
phrase <- clean(phrase)
final[final$word1 %in% c("saddest", "smelliest", "happiest",  "bluest"), ]
# word3 word2     word1           p3
# 10405  would  mean  happiest 9.862111e-08
# 25760  would  mean   saddest 2.739475e-08
# 137793 would  mean smelliest 5.478950e-09




# 4. 
phrase <- "Very early observations on the Bills game: Offense still struggling but the"
phrase <- clean(phrase)
final[final$word1 %in% c("referees", "players", "defense", "crowd"), ]
# word3 word2    word1           p3
# 1079  struggling   but  defense 1.263752e-05
# 2885  struggling   but  players 4.748165e-06
# 3212  struggling   but    crowd 2.658304e-06
# 16427 struggling   but referees 1.671889e-07




# 5. 
phrase <- "Go on a romantic date at the"
phrase <- clean(phrase)
final[final$word1 %in% c("grocery", "movies", "beach", "mall"), ]
# word3 word2   word1           p3
# 584   date    at   beach 4.207611e-05
# 750   date    at  movies 3.261643e-05
# 799   date    at    mall 2.977934e-05
# 1327  date    at grocery 1.796386e-05



# 6. 
phrase <- "Well I'm pretty sure my granny has some old bagpipes in her garage I'll dust them off and be on my"
phrase <- clean(phrase)
final[final$word1 %in% c("way", "horse", "motorcycle", "phone"), ]
# word3 word2      word1           p3
# 323     be    on        way 1.213489e-04
# 395     be    on      phone 5.954546e-05
# 3722    be    on motorcycle 1.639583e-06
# 8070    be    on      horse 6.184069e-07




# 7. 
phrase <- "Ohhhhh #PointBreak is on tomorrow. Love that film and haven't seen it in quite some"
phrase <- clean(phrase)
final[final$word1 %in% c("thing", "time", "weeks", "years"), ]
# word3 word2 word1           p3
# 321     in quite  time 2.843115e-05
# 389     in quite thing 1.636945e-05
# 1087    in quite years 4.087353e-06
# 2070    in quite weeks 2.203965e-06


# 8. 
phrase <- "After the ice bucket challenge Louis will push his long wet hair out of his eyes with his little"
phrase <- clean(phrase)
final[final$word1 %in% c("ears", "eyes", "fingers", "toes"), ]
# word3 word2   word1           p3
# 14    with   his    eyes 9.180707e-03 "wrong"
# 356   with   his    ears 2.603095e-04
# 729   with   his fingers 9.049782e-05
# 1698  with   his    toes 3.037639e-05


# 9. 
phrase <- "Be grateful for the good times and keep the faith during the"
phrase <- clean(phrase)
final[final$word1 %in% c("bad", "hard", "worse", "sad"), ]
# word2 word1           p2
# 616  during   bad 4.834370e-05
# 673  during  hard 4.112413e-05
# 1097 during   sad 2.019652e-05
# 1653 during worse 1.325111e-05



# 10. 
phrase <- "If this isn't the cutest thing you've ever seen, then you must be"
phrase <- clean(phrase)
final[final$word1 %in% c("callous", "asleep", "insensitive", "insane"), ]
# word3 word2       word1           p3
# 3009    you  must      insane 6.644441e-07
# 3934    you  must      asleep 4.983331e-07
# 15650   you  must insensitive 8.742686e-08
# 27124   you  must     callous 3.497074e-08




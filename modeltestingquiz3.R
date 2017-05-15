source("clean.R")

1.
phrase <- "When you breathe, I want to be the air for you. I'll be there for you, I'd live and I'd"
phrase <- clean(phrase)
final[final$word1 %in% c("give", "eat", "die", "sleep"), ]
# word3 word2 word1           p3
# 6    live   and   die 0.0379983802
# 124  live   and  give 0.0004572328
# 144  live   and   eat 0.0003755726
# 241  live   and sleep 0.0001996064

2.
phrase <- "Guy at my table's wife got up to go to the bathroom and I asked about 
                dessert and he started telling me about his"
phrase <- clean(phrase)
final[final$word1 %in% c("marital", "spiritual", "financial", "horticultural"), ]
# word3 word2     word1           p3
# 4793     me about financial 1.146554e-06 wrong
# 7479     me about spiritual 4.179030e-07
# 19226    me about   marital 8.572369e-08



3.
phrase <- "I'd give anything to see arctic monkeys this"
phrase <- clean(phrase)
final[final$word1 %in% c("morning", "decade", "month", "weekend"), ]
# word3   word2   word1           p3
# 435  arctic monkeys weekend 2.468841e-05
# 577  arctic monkeys morning 1.923097e-05
# 1387 arctic monkeys   month 9.550515e-06
# 9822 arctic monkeys  decade 1.234420e-06

4.
phrase <- "Talking to your mom has the same effect as a hug and helps reduce your"
phrase <- clean(phrase)
final[final$word1 %in% c("hunger", "stress", "happiness", "sleepiness"), ]
# word3  word2      word1           p3
# 29     helps reduce     stress 2.671648e-03
# 1592   helps reduce  happiness 1.385841e-05
# 2178   helps reduce     hunger 1.060378e-05
# 137463 helps reduce sleepiness 1.049879e-07

5.
phrase <- "When you were in Holland you were like 1 inch away from me but you hadn't time to take a"
phrase <- clean(phrase)
final[final$word1 %in% c("walk", "picture", "minute", "look"), ]
# word3 word2   word1           p3
# 282     to  take picture 2.444908e-05
# 730     to  take    look 2.982754e-06
# 1020    to  take    walk 1.022274e-06
# 4298    to  take  minute 1.815882e-07



6.
phrase <- "I'd just like all of these questions answered, a presentation of evidence, and a jury to settle the"
phrase <- clean(phrase)
final[final$word1 %in% c("matter", "incident", "case", "account"), ]
# word3  word2    word1           p3
# 727     to settle  account 3.420987e-06 wrong
# 848     to settle     case 3.028415e-06
# 1651    to settle   matter 1.766575e-06
# 4189    to settle incident 7.290628e-07


7.
phrase <- "I can't deal with unsymetrical things. I can't even hold an uneven number of bags
                                                                        of groceries in each"
phrase <- clean(phrase)
final[final$word1 %in% c("arm", "toe", "hand", "finger"), ]
# word3 word2  word1          p3
# 171   groceries    in   hand 1.513208e-04
# 3725  groceries    in    arm 2.201735e-06
# 9566  groceries    in finger 5.782721e-07
# 10494 groceries    in    toe 3.938955e-07


8.
phrase <- "Every inch of you is perfect from the bottom to the"
phrase <- clean(phrase)
final[final$word1 %in% c("side", "top", "center", "middle"), ]
# word3 word2  word1           p3
# 452  bottom    to    top 1.139625e-04
# 947  bottom    to center 3.901259e-05
# 1390 bottom    to   side 2.281068e-05
# 1481 bottom    to middle 2.108611e-05


9.
phrase <- "I'm thankful my childhood was filled with imagination and bruises from playing"
phrase <- clean(phrase)
final[final$word1 %in% c("daily", "weekly", "outside", "inside"), ]
# word3 word2   word1           p3
# 148  bruises  from outside 3.212746e-04
# 183  bruises  from  inside 2.573226e-04
# 1822 bruises  from  weekly 1.722189e-05
# 4557 bruises  from   daily 9.165973e-06


10.
phrase <- "I like how the same people are in almost all of Adam Sandler's"
phrase <- clean(phrase)
final[final$word1 %in% c("novels", "movies", "pictures", "stories"), ]
# word3 word2    word1           p3
# 826     of  adam   movies 1.023305e-05
# 858     of  adam  stories 9.890525e-06
# 878     of  adam pictures 9.633628e-06
# 5655    of  adam   novels 1.627013e-06



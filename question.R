# Question Investigation


# These are all the reviews 
# review.samples$text

# find people who mention dietary requirements in their reviews
# rows where they mention gluten
gf <- review.samples[ grepl('gluten', review.samples$text, ignore.case=TRUE ),] 
gf.users <- gf$user_id


#user_id, review_id, business_id, business.gf

require(sqldf)

gf.restaurants <- sqldf('select
                              a.*
                              ,"attributes.Dietary Restrictions.gluten-free"  
                  from gf a
                  left join businessf b
                  on a.business_id = b.business_id')



length(unique(raw.business$business_id))
# 61184



class Tweet < ApplicationRecord
    belongs_to :user

    validates :message, presence: true
    validates :message, length: {maximum: 140, 
too_long: "A tweet is only 140 max. Everybody knows that!"}

    has_many :tweet_tags
    has_many :tags, through: :tweet_tags


    ## Tweet.find(1) == @tweet
    # @tweet.tags -> [Tag, Tag, Tag, Tag]
    # def tags
    #     tts = TweetTag.where(tweet_id: @tweet.id)
    #     # -> [TweetTag, TweetTag, TweetTag, TweetTag]
    #     # @tweetTag -> tweet_id, tag_id
    #     tags = []
    #     tts.each do |tweetTag|
    #         tags.push(Tag.find_by(id: tweetTag.tag_id))
    #     end 

    #     return tags # -> [Tag, Tag, Tag]
    # end
end

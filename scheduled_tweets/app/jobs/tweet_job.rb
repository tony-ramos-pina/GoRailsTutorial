class TweetJob < ApplicationJob
  queue_as :default

  def perform(tweet)
    return if tweet.published? #by the time you call this job if tweet is already published it doesnt do anything

    return if tweet.publish_at > Time.current #by the time you call this job if tweet is rescheduled for a later time than now it doesnt do anything

    #it's better to make jobs do nothing than to cancel a job, so you can have more than one job for doing the same thing.

    tweet.publish_to_twitter!
  end
end

require "./people_browsr.rb"

id, key = '[app_id]', '[app_key]'

describe PeopleBrowsr::PeopleBrowsrAPI do
  api = PeopleBrowsr::PeopleBrowsrAPI.new(id, key)
  %W[
    at_name_cloud
    mentions
    density
    word_cloud
    hashtag_cloud
    mentions_retweets
    friends_and_followers
    top_followers
    positive_top_followers
    negative_top_followers
    popularity
    sentiment
    top_us_state
    top_countries
    top_urls
    top_pictures
    top_videos
    kred_influence
    kred_outreach
  ].each do |method|
    it "#{method} returns something for us" do
      data = api.send(method,
        last: 'yesterday',
        count: 30,
        source: 'twitter',
        term: 'zombies',
        limit: 300,
      )
      p data['data'] || data
      data['status'].should be_true
      data.should have_key 'data'
    end
  end
end

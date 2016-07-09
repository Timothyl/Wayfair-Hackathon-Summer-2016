class Twitter_Model

  # returns trending topics in USA
  def self.trends
    trends = Rails.cache.fetch('twitter_trends', :expires_in => 10.minutes) do
      $twitter.trends(23424977,{})
    end
    trends
  end

  def self.search(term)
    results = $twitter.search(term, result_type: "recent")
    search_result = []
    results.each do |tweet|
      text = tweet.text
      url = "https://twitter.com/statuses/#{tweet.id}"
      result_hash = {:text => text, :url => url}
      search_result.push(result_hash)
    end
    search_result
  end

  # returns current time
  def self.test
    time = Rails.cache.fetch('current_time', :expires_in => 5.minutes) do
      time = Time.new
      time.inspect
    end
  end
end

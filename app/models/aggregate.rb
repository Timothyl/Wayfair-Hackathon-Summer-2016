class Aggregate
  def self.load(term)
    results = Rails.cache.fetch("aggregate_#{term}", :expires_in => 10.minutes) do
      twitter_search = Twitter_Model.search(term)
        textarray = []
      twitter_search.each do |tweet|
        text = tweet[:text]
        textarray.push(text)
      end
      indico_analysis = Indico_Model.emotion(textarray)
      twitter_search.each_with_index do |tweet, index|
        tweet[:analysis] = indico_analysis[index]
        max = tweet[:analysis].max_by{|k,v| v}[0]
        color = ''
        if max == 'anger'
          color = 'red'
        elsif max == 'joy'
          color = 'yellow'
        elsif max == 'sadness'
          color = 'blue'
        elsif max == 'fear'
          color = 'purple'
        elsif max == 'surprise'
          color = 'orange'
        end
        tweet[:color] = color
      end
      twitter_search
    end
    results
  end
end

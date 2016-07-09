class NewsController < ApplicationController

  def index
    require 'indico'
    # @emotions = Indico.emotion("I did it. I got into Grad School. Not just any program, but a GREAT program. :-)")
    # @twitter_trends = Twitter.trends;
    @twitter_trends = Twitter_Model.test
  end
end

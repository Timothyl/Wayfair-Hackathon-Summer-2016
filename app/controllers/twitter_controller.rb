class TwitterController < ApplicationController
  require 'indico'

  def index
    term = params[:term]
    @twitter_search = Aggregate.load(term)
  end

  def show
    term = params[:term]
    @twitter_search = Aggregate.load(term)
    # @Indico_analysis = textarray
  end

end

module Api
  class MediaController < ApplicationController

    def health
      response = GiphyAdapter.search(health)
      gifs_sample = @results["data"].map {|gif| gif["images"]["fixed_height"]["url"]}.sample
      render :json gifs_sample.to_json
    end

end
module Api
  class MediaController < ApplicationController
    include GiphyAdapter

    def health
      response = GiphyAdapter.search(health)
      gifs_sample = response["data"].map {|gif| gif["images"]["fixed_height"]["url"]}.sample
      render :json gifs_sample.to_json
    end
  end
end
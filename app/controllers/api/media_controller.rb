module Api
  class MediaController < ApplicationController
    include GiphyAdapter

    def health
      response = GiphyAdapter.search("health")
      gifs_sample = response["data"].map {|gif| gif["images"]["fixed_height"]["url"]}.sample
      render json: gifs_sample.to_json
    end

    def productivity
      response = GiphyAdapter.search("productivity")
      gifs_sample = response["data"].map {|gif| gif["images"]["fixed_height"]["url"]}.sample
      render json: gifs_sample.to_json
    end

    def financial
      response = GiphyAdapter.search("financial")
      gifs_sample = response["data"].map {|gif| gif["images"]["fixed_height"]["url"]}.sample
      render json: gifs_sample.to_json
    end

    def growth
      response = GiphyAdapter.search("personal+growth")
      gifs_sample = response["data"].map {|gif| gif["images"]["fixed_height"]["url"]}.sample
      render json: gifs_sample.to_json
    end

    def fitness
      response = GiphyAdapter.search("fitness")
      gifs_sample = response["data"].map {|gif| gif["images"]["fixed_height"]["url"]}.sample
      render json: gifs_sample.to_json
    end
  end
end
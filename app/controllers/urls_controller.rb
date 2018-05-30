class UrlsController < ApplicationController


  def index
  end

  #POST - returns JSON of the newly created URL
  def create
  	
  	# puts "url #{request.base_url}"
  	render json: {}
  end

  def show
  end

  def stats
  end
end

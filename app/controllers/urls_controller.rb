class UrlsController < ApplicationController

  before_action :url, only:[:show, :stats]		
  def index
  end

  #POST - returns JSON of the newly created URL
  def create
  	@url = Url.build(params[:link],request.base_url)  	
  	render json: @url.to_json
  end

  #GET - redirects to actual link and also logs the request
  def show
  	referer = request.referer
  	referer = "NA" if referer.nil?
  	RequestLoggerJob.perform_later(params[:short_url],referer, request.env["HTTP_USER_AGENT"], request.remote_ip)
  	redirect_to @url.link
  end

  #GET - Fetch stats for the url
  def stats
  end

  private

  def url
  	 @url = Url.where(short_url_text: params[:short_url]).one
  end
end

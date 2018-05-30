class RequestLoggerJob < ApplicationJob
  queue_as :default

  def perform(short_url,referer,user_agent,remote_ip)
  	 url = Url.where(short_url_text: short_url).one
  	 country = Geocoder.search(remote_ip).first.country
  	 country = "unkown" if country.nil?
     log = Log.build(url,country,referer, user_agent,remote_ip)
  end
end

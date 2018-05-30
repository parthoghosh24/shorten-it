class Log
  include Mongoid::Document
  field :ip, type: String
  field :location, type: String
  field :referrer, type: String
  field :user_agent, type: String
  field :browser, type: String
  field :platform, type: String
  field :os, type: String
  embedded_in :url

  def self.build(url, location, referer, user_agent, remote_ip)
  	user_agent_parsed = UserAgent.parse(user_agent)
  	url.logs.create({ip: remote_ip, 
     				   location: location, 
     				   referrer:referer, 
     				   user_agent: user_agent, 
     				   browser: user_agent_parsed.browser,
     				   platform: user_agent_parsed.platform,
     				   os: user_agent_parsed.os})
  end

end

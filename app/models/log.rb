class Log
  include Mongoid::Document
  field :ip, type: String
  field :location, type: String
  field :referrer, type: String
  field :user_agent, type: String
  field :browser, type: String
  field :platform, type: String
  embedded_in :url
end

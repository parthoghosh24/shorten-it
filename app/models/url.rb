class Url
  include Mongoid::Document
  field :link, type: String
  field :short_url, type: String
  field :short_url_text, type: String
  embeds_many :logs
end

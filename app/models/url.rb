class Url
  include Mongoid::Document
  include Encryptable
  include Mongoid::Timestamps
  field :link, type: String
  field :short_url, type: String
  field :short_url_text, type: String
  embeds_many :logs
  validates_format_of :link, :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix, :multiline => true

  def self.build(link,base_url)
  	 shortened_url = encrypt(link)
  	 url = Url.create!({link:link, short_url: "#{base_url}/#{shortened_url}", short_url_text: shortened_url})
  	 url
  end

  def browsers
  	self.logs.pluck(:browser).uniq
  end

  def platforms
  	self.logs.pluck(:platform).uniq
  end

 def locations
 	self.logs.pluck(:location).uniq
 end

  def referers
  	self.logs.pluck(:referrer).uniq
  end

  def as_json(options={})
  	options = super(:except => [:_id])
  end


end

require 'rails_helper'

describe Log, type: :model do
  before(:all) do
  	@url = Url.build("https://github.com","http://shorten.it")
  	@short_url_text = @url.short_url_text
  	@log1 = Log.build(@url,"IN","https://google.com","Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36","20.197.105.223")
  	@log2 = Log.build(@url,"USA","https://twitter.com","Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.1 Safari/603.1.30","97.15.83.45")
  	@log3 = Log.build(@url,"IN","https://google.com","Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:48.0) Gecko/20100101 Firefox/48.0","209.183.204.193")
  	@log4 = Log.build(@url,"DE","https://google.com","Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36","120.240.152.139")
  	@log5 = Log.build(@url,"UK","https://facebook.com","Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:48.0) Gecko/20100101 Firefox/48.0","245.239.224.95")
 
  end

  it "should have been accessed from 3 browsers " do
  	 expect(@url.browsers.size).to eq(3)
  end

  it "should have been accessed from Chrome, Safari and Firefox " do
  	 expect(@url.browsers).to eq(["Chrome", "Safari", "Firefox"])
  end

  it "should have been accessed from Macintosh only" do
  	 expect(@url.platforms).to eq(["Macintosh"])
  end


  


end

module Encryptable
	extend ActiveSupport::Concern
	
	module ClassMethods 
		def encrypt(text)
			hashids = Hashids.new(text,5)
			encrypted = hashids.encode(Time.now.to_i)
			encrypted
		end
	end
	
end
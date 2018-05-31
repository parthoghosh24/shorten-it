module API
	class Base < Grape::API
		# TODO need to find out how to use Grape::Knock::Authenticable
		mount API::V1::Base

		# rescue_from Grape::Knock::ForbiddenError do
  #   		error!('403 Forbidden', 403)
  # 		end
	end
end
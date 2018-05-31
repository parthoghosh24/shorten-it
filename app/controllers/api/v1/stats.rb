module API
	module V1
		class Stats < Grape::API
			include API::V1::Defaults

			resource :stats do
				desc "Return all logs for an url"
				params do
					requires :short_url, type: String, desc: "Fetch all logs via Short url uri"
				end
				get ":short_url", root: "" do
					url = Url.find_by(short_url_text: params[:short_url])
					url.logs
				end

				desc "Return based on the browser"
				params do
					requires :short_url, type: String, desc: "Fetch all logs via Short url uri"
					requires  :browser, type: String, desc: "Filter by Browser"
				end
				get ":short_url/b/:browser", root: "" do
					url = Url.find_by(short_url_text: params[:short_url])
					url.logs.where(browser:params[:browser])
				end

				desc "Return based on the platform"
				params do
					requires :short_url, type: String, desc: "Fetch all logs via Short url uri"
					requires  :platform, type: String, desc: "Filter by Browser"
				end
				get ":short_url/p/:platform", root: "" do
					url = Url.find_by(short_url_text: params[:short_url])
					url.logs.where(platform:params[:platform])
				end

				desc "Return based on the country"
				params do
					requires :short_url, type: String, desc: "Fetch all logs via Short url uri"
					requires  :country, type: String, desc: "Filter by Country"
				end
				get ":short_url/c/:country", root: "" do
					url = Url.find_by(short_url_text: params[:short_url])
					url.logs.where(location:params[:country])
				end

			end
		end
	end
	
end
module API  
  module V1
    module Defaults
      extend ActiveSupport::Concern

      included do
        prefix "api"
        version "v1", using: :path
        default_format :json
        content_type :json, 'application/json; charset=UTF-8'
        format :json

        helpers do
          def permitted_params
            @permitted_params ||= declared(params, 
               include_missing: false)
          end

          def logger
            Rails.logger
          end
        end
      end
    end
  end
end 
module Errors
  module Handler
    def self.included(klass)
      klass.class_eval do
        rescue_from Errors::BaseError do |err|
          render status: err.status, json: err.to_hash.to_json
        end
      end
    end
  end
end
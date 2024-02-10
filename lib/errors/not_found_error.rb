module Errors
  class NotFoundError < BaseError
    def initialize(detail = nil)
      super(status: 404, title: "Not Found", detail: detail)
    end
  end
end
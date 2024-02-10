module Errors
  class BaseError < StandardError
    attr_reader :detail, :status, :title

    def initialize(status:, title:, detail:)
      @detail = detail
      @status = status
      @title = title
    end

    def to_hash
      {
        error: {
          status: status,
          title: title,
          detail: detail
        }
      }
    end
  end
end
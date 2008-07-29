require 'rexchange/exchange_request'

module RExchange
  class ItemDeletionError < StandardError
    attr_reader :href, :status, :message

    def initialize(href, status, message)
      @href, @status, @message = href, status, message
      super("The item located at #{href} could not be deleted, the servers response was #{status}: #{message}")
    end
  end

  class DavDeleteRequest < ExchangeRequest
    METHOD = 'DELETE'
    REQUEST_HAS_BODY = false
    RESPONSE_HAS_BODY = true
    
    def self.execute(credentials, source)
      response = super(credentials, :path => source)

      if response.code == "200" || response.code == "204"
        return true
      else
        raise ItemDeletionError.new(source, response.code, response.message)
      end
    end
  end
end
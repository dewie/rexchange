require 'open-uri'
require 'rexchange/generic_item'

module RExchange
  class AttachmentRequest < ExchangeRequest
    METHOD = "GET"
    REQUEST_HAS_BODY = false
    RESPONSE_HAS_BODY = true
  end

  class Attachment < GenericItem
    attribute_mappings :name => 'urn:schemas:httpmail:attachmentfilename',
      :size => 'http://schemas.microsoft.com/mapi/proptag/x0e200003'

    def body
      AttachmentRequest.execute(@session, :path => self.href).body
    end
    alias_method :read, :body

    def save_as(filename)
      File.open(filename, "wb") {|f| f << self.body}
    end

    def save_in(folder)
      self.save_as File.join(folder, self.name)
    end
  end
end
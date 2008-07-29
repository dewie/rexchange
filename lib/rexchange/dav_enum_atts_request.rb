require 'rexchange/exchange_request'

module RExchange
  class DavEnumAttsRequest < ExchangeRequest
    METHOD = 'X-MS-ENUMATTS'
    REQUEST_HAS_BODY = false
    RESPONSE_HAS_BODY = true
    
    def self.execute(credentials, source)
      options = {
        :headers => {
          'Depth' => 1,
          'Content-type' => "xml"
        },
        :path => source
      }
      
      response = super(credentials, options)
      items = []
      attachment_xpath = "//a:response"
      properties_xpath = "//a:propstat[a:status/text() = 'HTTP/1.1 200 OK']/a:prop"

      REXML::Document.new(response.body).elements.each(attachment_xpath) do |m|
        a = Attachment.new(credentials, m.elements[properties_xpath])
        a.href = m.elements["a:href"].text
        items << a
      end

      items
    end
  end
end
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

      XML::Parser.string(response.body).parse.find(attachment_xpath).each do |m|
        a = Attachment.new(credentials, m.find_first(properties_xpath))
        a.href = m.find_first("a:href").content
        items << a        
      end

      items
    end
  end
end
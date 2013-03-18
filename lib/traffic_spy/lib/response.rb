module TrafficSpy
  class Response
    attr_accessor :status, :body

    DEFAULT_STATUS_CODE = 200
    DEFAULT_BODY = ""

    def initialize(input = {})
      @status = input[:status] || DEFAULT_STATUS_CODE
      @body = input[:body] || DEFAULT_BODY
    end
  end
end

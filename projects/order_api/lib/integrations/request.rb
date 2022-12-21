module Integrations
  class Request

    def post!
      parser(::HTTParty.post(uri, body: params))
    end

    def delete!
      parser(::HTTParty.delete(uri))
    end

    private

    def uri
      raise NotImplementedError
    end

    def params
      {}
    end

    def parser(response)
      response.error! unless response.code == 200
      response.parsed_response
    end
  end
end

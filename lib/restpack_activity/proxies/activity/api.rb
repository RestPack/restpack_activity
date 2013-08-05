require 'rest_client'

module RestPack::Activity::Proxies
  class Api
    def self.get(id)
      http(:get, "/api/v1/activities/#{id}.json")
    end

    def self.list(params = {})
      http(:get, "/api/v1/activities.json", params)
    end

    def self.create(params)
      http(:post, "/api/v1/activities.json", params)
    end

    def self.update(params)
      http(:put, "/api/v1/activities/#{params[:id]}.json", params)
    end

    private

    def self.http(method, path, params = {})
      params = { params: params } if method == :get

      RestClient.send(method, "#{RestPack::Activity.config.api_domain}#{path}", params) do |rest_response|
        response = RestPack::Response.from_rest(rest_response)
        raise_exceptions_if_required(response)
        response
      end
    end

    def self.raise_exceptions_if_required(response)
      if !response.success?
        case(response.status)
        when :not_found
          raise ActiveRecord::RecordNotFound
        end
      end
    end
  end
end

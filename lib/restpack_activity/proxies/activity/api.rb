require 'rest_client'

module RestPack::Activity::Proxies
  class Api < RestPack::BaseProxy
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

    def self.destroy(id)
      http(:delete, "/api/v1/activities/#{id}.json")
    end

    private

    def self.http(method, path, params = {})
      params = { params: params } if method == :get

      RestClient.send(method, "#{RestPack::Activity.config.api_domain}#{path}", params) do |rest_response|
        response = RestPack::Service::Response.from_rest(rest_response)
        raise_exceptions_if_required(response)
        response
      end
    end
  end
end

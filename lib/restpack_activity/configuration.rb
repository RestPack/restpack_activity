module RestPack::Activity
  class Configuration
    attr_accessor :service_type, :application_id, :api_domain, :api_token

    def initialize
      @service_type = :local
      @application_id = 1
    end
  end
end

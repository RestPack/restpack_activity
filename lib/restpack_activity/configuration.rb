module RestPack::Activity
  class Configuration
    attr_accessor :service_proxy_type, :application_id

    def initialize
      @service_proxy_type = :local
      @application_id = 1
    end
  end
end

module RestPack::Activity
  class Configuration
    attr_accessor :service_proxy_type

    def initialize
      @service_proxy_type = :local
    end
  end
end

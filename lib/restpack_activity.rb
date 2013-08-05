require "active_model"
require "active_support/core_ext"

require "restpack_activity/version"
require "restpack_activity/configuration"
require "restpack_activity/models/page"
require "restpack_activity/models/activity"

require "restpack_activity/proxies/base_proxy"
require "restpack_activity/proxies/activity/api"
require "restpack_activity/proxies/activity/local"


module RestPack
  module Activity
    mattr_accessor :config
    @@config = Configuration.new

    def self.setup
      yield @@config
    end
  end
end

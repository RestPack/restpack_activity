require_relative '../spec_helper'

describe Activity do
  describe ".service proxy" do
    before { @original = RestPack::Activity.config.service_type }
    after { RestPack::Activity.config.service_type = @original }

    it "resolves :local proxy" do
      RestPack::Activity.config.service_type = :local
      Activity.service.should == RestPack::Activity::Proxies::Local
    end

    it "resolves :api proxy" do
      RestPack::Activity.config.service_type = :api
      Activity.service.should == RestPack::Activity::Proxies::Api
    end
  end
end

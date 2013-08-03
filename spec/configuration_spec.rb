require 'spec_helper'

describe RestPack::Activity::Configuration do

  context "defaults" do
    context ".service_proxy_type" do
      it { RestPack::Activity.config.service_proxy_type.should == :local }
    end
  end

end

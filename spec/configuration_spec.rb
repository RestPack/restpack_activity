require 'spec_helper'

describe RestPack::Activity::Configuration do

  context "by default" do
    it { RestPack::Activity.config.service_proxy_type.should == :db }
  end

end

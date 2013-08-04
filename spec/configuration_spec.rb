require 'spec_helper'

describe RestPack::Activity::Configuration do

  context "defaults" do
    it "has default service_proxy_type" do
      RestPack::Activity.config.service_proxy_type.should == :local
    end

    it "has default application_id" do
      RestPack::Activity.config.application_id.should == 1
    end
  end

end

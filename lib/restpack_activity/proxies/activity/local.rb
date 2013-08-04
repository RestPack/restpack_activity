module RestPack::Activity::Proxies
  class Local
    def self.get(id)
      RestPack::Services::Activity::Get.run({
        id: id,
        application_id: RestPack::Activity.config.application_id
      })
    end

    def self.list(params = {})
      RestPack::Services::Activity::List.run(params, {
        application_id: RestPack::Activity.config.application_id
      })
    end
  end
end

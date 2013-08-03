module RestPack::Activity::Proxies
  class Local
    def self.get(id)
      RestPack::Services::Activity::Get.run({ id: id, application_id: 1 })
    end

    def self.list(params = {})
      RestPack::Services::Activity::List.run(params, { application_id: 1 })
    end
  end
end

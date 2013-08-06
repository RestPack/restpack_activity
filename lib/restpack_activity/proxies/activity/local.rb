module RestPack::Activity::Proxies
  class Local < RestPack::BaseProxy
    def self.get(id)
      response = RestPack::Services::Activity::Get.run({
        id: id,
        application_id: RestPack::Activity.config.application_id
      })

      raise_exceptions_if_required(response)
      response
    end

    def self.list(params = {})
      response = RestPack::Services::Activity::List.run(params, {
        application_id: RestPack::Activity.config.application_id
      })

      raise_exceptions_if_required(response)
      response
    end

    def self.create(params)
      response = RestPack::Services::Activity::Create.run(params, {
        application_id: RestPack::Activity.config.application_id
      })

      raise_exceptions_if_required(response)
      response
    end

    def self.update(params)
      response = RestPack::Services::Activity::Update.run(params, {
        application_id: RestPack::Activity.config.application_id
      })

      raise_exceptions_if_required(response)
      response
    end

    def self.destroy(id)
      response = RestPack::Services::Activity::Destroy.run({
        id: id,
        application_id: RestPack::Activity.config.application_id
      })

      raise_exceptions_if_required(response)
      response
    end
  end
end

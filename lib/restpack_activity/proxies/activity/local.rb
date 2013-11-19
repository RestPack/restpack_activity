module RestPack::Activity::Proxies
  class Local < RestPack::BaseProxy
    def self.get(id)
      response = Commands::Activities::Activity::Get.run({
        id: id,
        application_id: RestPack::Activity.config.application_id
      })

      raise_exceptions_if_required(response)
      response
    end

    def self.list(params = {})
      response = Commands::Activities::Activity::List.run(params, {
        application_id: RestPack::Activity.config.application_id
      })

      raise_exceptions_if_required(response)
      response
    end

    def self.create(params)
      response = Commands::Activities::Activity::Create.run(params, {
        application_id: RestPack::Activity.config.application_id
      })

      raise_exceptions_if_required(response)
      response
    end

    def self.update(params)
      response = Commands::Activities::Activity::Update.run(params, {
        application_id: RestPack::Activity.config.application_id
      })

      raise_exceptions_if_required(response)
      response
    end

    def self.destroy(id)
      response = Commands::Activities::Activity::Destry.run({
        id: id,
        application_id: RestPack::Activity.config.application_id
      })

      raise_exceptions_if_required(response)
      response
    end
  end
end

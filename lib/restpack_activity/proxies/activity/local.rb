module RestPack::Activity::Proxies
  class Local
    def self.get(id)
      response = RestPack::Services::Activity::Get.run({
        id: id,
        application_id: RestPack::Activity.config.application_id
      })

      if !response.success?
        case(response.status)
        when :not_found
          raise ActiveRecord::RecordNotFound
        else
          raise "Service Error"
        end
      end

      response
    end

    def self.list(params = {})
      RestPack::Services::Activity::List.run(params, {
        application_id: RestPack::Activity.config.application_id
      })
    end

    def self.create(params)
      RestPack::Services::Activity::Create.run(params, {
        application_id: RestPack::Activity.config.application_id
      })
    end

    def self.update(params)
      RestPack::Services::Activity::Update.run(params, {
        application_id: RestPack::Activity.config.application_id
      })
    end
  end
end

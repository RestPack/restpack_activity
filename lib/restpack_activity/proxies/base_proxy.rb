require 'rest_client'

module RestPack
  class BaseProxy
    def self.raise_exceptions_if_required(response)
      if !response.success?
        case(response.status)
        when :not_found
          raise ActiveRecord::RecordNotFound
        when :unauthorized
          raise "Unauthorized RestPack request"
        end
      end
    end
  end
end

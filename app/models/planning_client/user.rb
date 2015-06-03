require 'planning_client/service_configuration'

module PlanningClient
  class User < LogicalModel

    include PlanningClient::ServiceConfiguration

    set_resource_url PlanningClient::HOST, '/v0/users'

    attribute :id
    attribute :daily_email_reminder_enabled
    attribute :username

    def self.find_by_name (username)
      self.find(1, {username: username})
    end

    def json_root
      'user'
    end
   
  end
end

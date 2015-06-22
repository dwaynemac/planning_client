require 'planning_client/service_configuration'

module PlanningClient
  class User < LogicalModel

    include PlanningClient::ServiceConfiguration

    set_resource_url PlanningClient::HOST, '/v0/users'

    attribute :id
    attribute :daily_email_reminder_enabled
    attribute :username
    attribute :email

    # Updates User only if necessary to avoid
    # requests with no effect.
    #
    # @params [Hash] params
    #   daily_email: Boolean
    #   email: String
    def update_if_necessary(params)
      update_needed = false 
      
      if !params[:daily_email].nil? &&
          self.daily_email_reminder_enabled != params[:daily_email]
        update_needed = true
        self.daily_email_reminder_enabled = params[:daily_email]
      end

      if !params[:email].nil? && 
          self.email != params[:email]
        update_needed = true
        self.email = params[:email]
      end

      if update_needed
        self.save
      end
    end

    def json_root
      'user'
    end
   
  end
end

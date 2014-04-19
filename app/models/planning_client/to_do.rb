require 'planning_client/service_configuration'

module PlanningClient
  class ToDo < LogicalModel
    include PlanningClient::ServiceConfiguration

    set_resource_path '/v0/to_dos'

    attribute :id

    attribute :state

    attribute :context_id
    attribute :contact_type

    attribute :requester_username
    attribute :responsible_username

    attribute :description

    attribute :due_at

    attribute :account_name

    # mark ToDo as in progress
    def start
      if self.status_transition("start")
        self.state = 'in_progress'
        self
      else
        nil
      end
    end
   
    # mark ToDo as in stand by
    def hold
      if self.status_transition("hold")
        self.state = 'stand_by'
        self
      else
        nil
      end
    end
   
    # mark ToDo as completed
    def complete
      if self.status_transition("complete")
        self.state = 'completed'
        self
      else
        nil
      end
    end
   
    protected

    def status_transition(transition)
      response = Typhoeus::Request.get( "#{self.class.resource_uri(id)}/#{transition}", params: self.class.merge_key({}) )
      if response.code == 200
        log_ok(response)
        return self
      else
        log_failed(response)
        return nil
      end
    end
  end
end

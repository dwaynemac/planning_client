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
  end
end

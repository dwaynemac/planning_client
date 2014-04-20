require 'planning_client/service_configuration'

module PlanningClient
  class Checklist < LogicalModel
    include PlanningClient::ServiceConfiguration

    set_resource_path '/v0/checklists'

    attribute :id
    attribute :name
    attribute :description

    has_many :items, class: 'PlanningClient::ChecklistItem'

    # TODO assign_to -- we need to add support for responsible/requester username on checklist assignment
  end
end

require 'planning_client/service_configuration'

module PlanningClient
  class ChecklistItem < LogicalModel
    include PlanningClient::ServiceConfiguration

    set_resource_path '/v0/checklist_items'

    attribute :id
    
    belongs_to :checklist, class: 'PlanningClient::Checklist'

    attribute :description
    attribute :offset
    attribute :offset_type

    attribute :context_id
    attribute :context_type

  end
end

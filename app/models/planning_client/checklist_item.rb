require 'planning_client/service_configuration'

module PlanningClient
  class ChecklistItem < LogicalModel
    include PlanningClient::ServiceConfiguration

    set_resource_url PlanningClient::HOST, '/v0/checklist_items'

    attribute :id
    
    belongs_to :checklist, class: 'PlanningClient::Checklist'

    attribute :description
    attribute :offset
    attribute :offset_type

    attribute :context_id
    attribute :context_type

    def json_root
      'checklist_item'
    end

  end
end

require 'mailchimp_client/service_configuration'

module NucleoClient
  class Federation < LogicalModel
    include NucleoClient::ServiceConfiguration
    set_resource_path '/federations'

    attribute :id_federacao
    attribute :fed_nome

    alias_attribute :id, :id_federacao
    alias_attribute :name, :fed_nome

    def schools
      School.paginate(federation_id: self.id)
    end
  end
end

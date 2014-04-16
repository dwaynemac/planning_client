module PlanningClient
  module ServiceConfiguration
    def self.included(base)
      base.send('use_hydra', PlanningClient::HYDRA)

      host = case ENV['RACK_ENV']
        when 'development'
          PlanningClient::HOST
        when 'production'
          'padma-planning.heroku.com'
      end

      base.send('set_resource_host', host)
      base.send('configure_index_response', {collection: 'collection', total: 'total'})

      base.send('set_api_key','app_key',ENV['planning_api_key'])
    end
  end
end

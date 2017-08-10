module WebhookService
  class Processor
    def initialize(webhook)
      @webhook = webhook

      run!
    end

    def run!
      # handler = if @webook.is_github?
      #             Integrations::Github
      #           elsif @webook.is_pivotal?
      #             Integrations::PivotalTracker
      #           else
      #             Integrations::Base
      #           end

      Integrations::Github.process(@webhook)
    end
  end
end
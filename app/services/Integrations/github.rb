module Integrations
  class Github < Base
    def self.process(integration)
      # 1. Get the fields necessary to construct comment and format accordingly
      # 2. create comment

      # Example text
      # [branch] 1 new commit by X
      # [sha hash] Description - X

      # data = integration.payload
      # branch = integration["ref"].split('/')[-1]
      # commits = data["commits"]
      #
      # commits_array = []
      # commits.each do |c|
      #   commits_array << {id: c["id"], description: c["message"], committer_name: c["committer"]["name"]}
      # end
      #
      # commits_count = commits_array.count
    end
  end
end
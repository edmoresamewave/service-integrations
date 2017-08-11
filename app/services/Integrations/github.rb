module Integrations
  class Github < Base
    def self.process(integration)
      @integration = integration

      push if @integration.present? && @integration.headers['X-Github-Event'] == 'push'
    end

    def self.push
      # 1. Get the fields necessary to construct comment and format comment accordingly
      # 2. create comment and update webhook processed field

      # Example text
      # [branch] 1 new commit by X
      # [sha hash] Description - X

      data = @integration.payload
      repository_name = @integration.payload["repository"]["name"]
      branch = @integration.payload["ref"].split('/')[-1]
      commits = data["commits"]

      commits_array = []
      commits.each do |c|
        commits_array << {id: c["id"],
                          description: c["message"],
                          committer_name: c["committer"]["name"],
                          url: c["url"]}
      end
      commits_count = commits_array.count

      wc = WebhookConfig.find_by_stream_id(@integration.stream_id)
      comment = Comment.new(creator_id: wc.post_as,
                            stream_id: wc.stream_id,
                            body: "#{repository_name}:#{branch} #{commits_count} new commits(s) by #{commits_array[0][:committer_name]}")

      if comment.save!
        @integration.processed = true
        @integration.save!
      end
    end
  end
end
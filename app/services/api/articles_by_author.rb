module Api
  class ArticlesByAuthor < ApplicationService
    def call
      collate_results(Api::ArticlesByAuthorQuery.call(author: author))
    end

    private

    def collate_results(results)

      results.each_with_object([]) { |data, memo|
        memo << data.merge!({friendly_name: Issue.find_by(id: data['issue_id']).friendly_name })
      }
    end

    def author
      @options[:author]
    end
  end
end

class PublicController < ApplicationController
  skip_before_action :authenticate_user!
  
  def welcome; end

  def status
    @magazines = Magazine.all.order(alpha_guide: :asc)
    @article_count = Article.count
  end

  def search
    sort = params[:sort] || :id
    direction = params[:direction] || :asc

    @articles = Article.accessible_by(current_ability)
                       .search(params.slice(:author_contains,
                                            :by_article_type,
                                            :by_language,
                                            :by_magazine,
                                            :by_year,
                                            :for_machines,
                                            :has_all_tags,
                                            :has_text
                                           )
                              )
    @full_count = @articles.count

    # @articles = @articles.order(sort => direction)
    #                  .page(params[:page])
    @articles = @articles.page(params[:page])
  end

  def article
    @article = Article.find(params[:id])
    respond_to do |format|
      format.html { render layout: true }
      format.js { render layout: false }
    end
  end
end

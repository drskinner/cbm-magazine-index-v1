class PublicController < ApplicationController
  skip_before_action :authenticate_user!
  
  def welcome; end

  def status
    @magazines = Magazine.all
    @article_count = Article.count
  end

  def search
    sort = params[:sort] || :id
    direction = params[:direction] || :asc

    @articles = Article.accessible_by(current_ability)
                       .search(params.slice(:by_magazine_id, :by_year))
    @full_count = @articles.count

    # @articles = @articles.order(sort => direction)
    #                  .page(params[:page])
    @articles = @articles.page(params[:page])
  end

  def modal_test
    sort = params[:sort] || :id
    direction = params[:direction] || :asc

    @articles = Article.accessible_by(current_ability)
                       .search(params.slice(:by_magazine_id, :by_year))
    @full_count = @articles.count

    # @articles = @articles.order(sort => direction)
    #                  .page(params[:page])
    @articles = @articles.page(params[:page])
  end

  def article
    puts 'HERE'
    @article = Article.find(params[:id])
    respond_to do |format|
      format.js {render layout: false}
    end
  end
end

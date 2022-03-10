class ArticlesController < ApplicationController
  load_and_authorize_resource

  def index
    sort = params[:sort] || :id
    direction = params[:direction] || :asc

    @articles = Article.accessible_by(current_ability)
                       .search(params.slice(:by_magazine, :by_year))
    @full_count = @articles.count

    # @articles = @articles.order(sort => direction)
    #                  .page(params[:page])
    @articles = @articles.page(params[:page])
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  private

  def article_params
    params.require(:article)
          .permit(
            :author,
            :blurb,
            :classification_id,
            :description,
            :issue_id,
            :language_id,
            :page,
            :title,
            machine_ids: [],
            tag_ids: []
          )
  end
end

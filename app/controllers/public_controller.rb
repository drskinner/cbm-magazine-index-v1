class PublicController < ApplicationController
  skip_before_action :authenticate_user!
  
  def welcome; end

  def status
    @magazines = Magazine.all
    @article_count = Article.count
  end
end

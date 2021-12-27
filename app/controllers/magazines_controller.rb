class MagazinesController < ApplicationController
  load_and_authorize_resource

  def index
    sort = params[:sort] || :id
    direction = params[:direction] || :asc

    @magazines = Magazine.accessible_by(current_ability)
                     .search(params.slice(:name_contains))
    @full_count = @magazines.count

    # @magazines = @magazines.order(sort => direction)
    #                        .page(params[:page])
  end
end

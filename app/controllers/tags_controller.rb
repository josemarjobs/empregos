class TagsController < ApplicationController
  def index
  end

  def show
		@tag = Tag.find(params[:id])
		@vagas = @tag.vagas.order("created_at DESC").page(params[:page]).per(8)
  end
end

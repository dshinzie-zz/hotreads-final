class Api::V1::LinksController < ApplicationController

  def top_links
    render json: Link.top_links.first
  end

  def top_ten
    render json: Link.top_links
  end

end

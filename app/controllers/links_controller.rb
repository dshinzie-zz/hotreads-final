class LinksController < ApplicationController
  def index
    check_for_updates
    @links = Link.top_links
  end

  private
    def check_for_updates
      Link.get_new_links
    end
end

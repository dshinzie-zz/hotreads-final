class LinksController < ApplicationController
  def index
    check_for_updates
    @links = Link.top_links
  end

  private
    def check_for_updates
      connection = Bunny.new({:host => "experiments.turing.io", :port => "5672", :user => "student", :pass => "PLDa{g7t4Fy@47H"})
      # connection = Bunny.new(ENV["publisher"])
      pubsub = PubSub.new(connection)

      Link.get_new_links(pubsub)
    end

end

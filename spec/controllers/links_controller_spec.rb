require 'rails_helper'

RSpec.describe LinksController, :type => :controller do
  describe "GET index" do
    it "assigns @links" do
      links = 10.times do |i|
        Link.create(title: "#{i}", url: "#{i}", read: false)
      end

      get :index

      expect(response.status).to eq(200)
    end

  end
end

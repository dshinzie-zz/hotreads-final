require 'rails_helper'

describe "API" do
  context "methods" do
    it "top_link" do
      10.times do |i|
        Link.create(title: "#{i}", url: "#{i}", read: false)
      end

      get "/api/v1/top_link/"
      parsed = JSON.parse(response.body)

      expect(response).to be_success

      expect(parsed["link_count"]).to eq(1)
      expect(parsed["url"]).to eq(Link.top_links.first.url)
    end

    it "top_ten" do
      10.times do |i|
        Link.create(title: "#{i}", url: "#{i}", read: false)
      end

      get "/api/v1/top_ten/"
      parsed = JSON.parse(response.body)

      expect(response).to be_success
      expect(parsed.count).to eq(10)
      expect(parsed.first["url"]).to eq(Link.top_links.first.url)
      expect(parsed.last["url"]).to eq(Link.top_links.last.url)
    end
  end
end

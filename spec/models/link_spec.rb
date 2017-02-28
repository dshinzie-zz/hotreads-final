require 'rails_helper'

describe "link" do
  context "methods" do
    it "top_links" do
      10.times do |i|
        Link.create(title: "#{i}", url: "#{i}", read: false)
      end

      result = Link.top_links

      expect(result.class).to eq(Link::ActiveRecord_Relation)
    end
  end
end

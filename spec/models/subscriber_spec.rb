require 'rails_helper'

describe "subscriber" do
  context "subscribing data" do
    it "sends payload" do
      connection = BunnyMock.new
      pubsub = PubSub.new(connection)

      publication = pubsub.subscribe_to_queue

      expect(publication).to_not eq(nil)
      expect(pubsub.lockbox_to_hotreads_queue.name).to eq("ds.lockbox.to.hotreads")
    end
  end
end

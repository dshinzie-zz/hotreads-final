class PubSub
  attr_reader :lockbox_to_hotreads_queue, :hotreads_to_lockbox_queue, :hotreads_to_lockbox_queue_top

  def initialize(connection)
    connection.start
    channel = connection.create_channel
    @lockbox_to_hotreads_queue = channel.queue("ds.lockbox.to.hotreads")
  end

  def subscribe_to_queue
    puts "Subscribing to queue"

    lockbox_to_hotreads_queue.subscribe do |delivery_info, metadata, payload|
      parsed = JSON.parse(payload)
      puts "Received Link: #{parsed}"

      Link.create_from_publisher(parsed)
    end

    sleep 2
  end

end

class Subscriber
  attr_reader :lockbox_to_hotreads_queue

  def initialize(connection)
    # connection = Bunny.new({:host => "experiments.turing.io", :port => "5672", :user => "student", :pass => "PLDa{g7t4Fy@47H"})
    # connection = Bunny.new(ENV["publisher"])
    create_channel(connection)
  end

  def create_channel(connection)
    connection.start
    channel = connection.create_channel
    @lockbox_to_hotreads_queue = channel.queue("ds.lockbox.to.hotreads")
  end

  def subscribe_to_queue
    puts "Subscribing from queue"
    lockbox_to_hotreads_queue.subscribe do |delivery_info, metadata, payload|
      parsed = JSON.parse(payload)
      puts "Received Link: #{parsed}"

      Link.create_from_publisher(parsed)
    end

    sleep 2
  end

end

class Link < ApplicationRecord

  def self.get_new_links(pubsub)
    pubsub.subscribe_to_queue
  end

  def self.create_from_publisher(input)
    link_params = {
      title: input["title"],
      url: input["url"],
      read: input["read"]
    }

    link = new(link_params)

    if(link.save)
      puts "Link created"
    else
      puts "Error creating link"
    end

  end

  def self.top_links
    select("links.url, count(links.url) as link_count")
    .where('links.updated_at > ?', Time.now - 1.day)
    .group("links.url")
    .order("link_count DESC")
    .limit(10)
  end

end

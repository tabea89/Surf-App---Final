class ProductChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def listen(data)
  	stop_all_streams
  	stream_for data["product_id"]

  end

  ActionCable.server.broadcast 'product_channel', comment: "Hello World", average_rating: 5

end

class Application

  def call(env)
    response = Rack::Response.new
    request = Rack::Request.new(env)

  if request.path.match(/items/)
    item_match = request.path.split("/items/").last
    item = @@items.find{|s| s.name == item_match}
    if item
      response.write item.price

  else
    response.write "Item not found"
    response.status = 400
    end
  else
    response.write "Route not found"
    response.status = 404
  end
    response.finish
  end
end

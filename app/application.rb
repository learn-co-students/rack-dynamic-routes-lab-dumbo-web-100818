require "pry"

class Application

  @@items = [Item.new("Apples", 5), Item.new("Pear", 3)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
       item_name = req.path.split("/items/").last
       # binding.pry
       item_instance = @@items.find{|item| item.name == item_name}
       if item_instance
         resp.write "working "
         final_name = item_instance.price
         resp.write final_name
       else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end

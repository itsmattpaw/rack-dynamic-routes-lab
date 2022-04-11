class Application
    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            item = req.path.split("/items/").last
            j = @@items.select {|n| n.name == item}
            if j.first != nil
                resp.write "#{j.first.price}"
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
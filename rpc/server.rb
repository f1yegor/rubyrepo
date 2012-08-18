require "xmlrpc/server"

class Num
  INTERFACE = XMLRPC::interface("num") {
    meth 'string add(strint, string)', 'concatenate two strings', 'add'
    #meth ''
   }

  def add(a, b) c = a + " " + b; c.upcase end
end


s = XMLRPC::Server.new(8080)
s.add_handler(Num::INTERFACE, Num.new)
s.serve

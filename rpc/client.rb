require "xmlrpc/client"

# Make an object to represent the XML-RPC server.

server = XMLRPC::Client.new("localhost","/RPC2",8080)

# Call the remote server and get our result
while true do

puts "enter some string"
print "type first > "
one = gets.chomp
print "and second > "
second = gets.chomp
result = server.call("num.add", one, second)


puts "Response: #{result}"
end

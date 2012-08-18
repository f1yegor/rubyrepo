require 'rubygems'
require 'mongo'

@conn = Mongo::Connection.new
@db   = @conn['sample-db']
@coll = @db['test']
alphabet = ('a'..'z').to_a
alphabet_size = alphabet.size
1000.times { |i|
 @coll.insert({alphabet[i % alphabet_size] => i})
}

puts "There are #{@coll.count} records. Here they are:"
@coll.find.each{ |doc| puts doc.inspect }

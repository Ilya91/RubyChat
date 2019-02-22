# begin
#   puts 'Before'
#   1/0
# rescue StandardError => e
#   puts "You can not do that! #{e.message}"
#   puts e.backtrace.inspect
# raise
# rescue RuntimeError => e
#   puts "runtime #{e}"
# end
#
# puts 'After'




# def method_with_error
#
#   raise ArgumentError, 'Oh no!'
# end
#
# begin
#   method_with_error
# rescue RuntimeError => e
#   puts e.inspect
# end
# puts 'After'
#


# def sqrt(value)
#   sqrt = Math.sqrt(value)
#   puts sqrt
# rescue StandardError
#   puts 'Incorrect value'
# end
#
# sqrt(-1)
#
#


def connect
  raise 'connection error'
end

attempt = 0
begin
  connect
rescue RuntimeError
  attempt += 1
  puts 'check connection!'
  retry if attempt < 3
ensure
  puts "attempts: #{attempt}"
end


require "rqrcode"

puts "What kind of QR code would you like to generate"
puts
puts "1. Open a URL"
puts "2. Join a wifi network"
puts "3. Send a text message"
puts
puts "Press 4 to exit"
puts

option = gets.chomp
puts

if option.include? "1"
  puts "What is the URL you would like to encode?"
  puts
  to_qr = gets.chomp 
elsif option.include? "2"
  puts "What is the name of the wifi network?"
  puts
  name = gets.chomp
  puts
  puts "What is the password?"
  puts
  pass = gets.chomp
  to_qr = "WIFI:T:WPA;S:#{name};P:#{pass};;"
elsif option.include? "3"
  puts "What is the phone number you want the code to send a text message to?"
  puts
  number = gets.chomp
  puts
  puts "What do you want to populate the message with?"
  puts
  msg = gets.chomp
  to_qr = "SMSTO:#{number}:#{msg}"
else
  exit
end

puts
puts "What would you like to call the PNG?"
puts
file_name = gets.chomp
qrcode = RQRCode::QRCode.new(to_qr)

# Use the .as_png method to create a 500 pixels by 500 pixels image
png = qrcode.as_png({ :size => 500 })

# Write the image data to a file
IO.binwrite("#{file_name}.png", png.to_s)

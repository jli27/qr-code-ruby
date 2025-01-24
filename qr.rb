require "rqrcode"

puts "What kind of QR code would you like to generate"
puts ""

puts "1. Open a URL"
puts "2. Join a wifi network"
puts "3. Send a text message"

puts ""
puts "Press 4 to exit"

option = gets.chomp

if option.include? "1"
  puts "What is the URL you would like to encode?"
  to_qr = gets.chomp 
elsif option.include? "2"
  puts "What is the name of the wifi network?"
  name = gets.chomp
  puts "What is the password?"
  pass = gets.chomp
  to_qr = "WIFI:T:WPA;S:#{name};P:#{pass};;"
elsif option.include? "3"
  puts "What is the phone number you want the code to send a text message to?"
  number = gets.chomp
  puts "What do you want to populate the message with?"
  msg = gets.chomp
  to_qr = "SMSTO:#{number}:#{msg}"
else
  exit
end

puts "What would you like to call the PNG?"
name = gets.chomp
qrcode = RQRCode::QRCode.new(to_qr)

# Use the .as_png method to create a 500 pixels by 500 pixels image
png = qrcode.as_png({ :size => 500 })

# Write the image data to a file
IO.binwrite(name, png.to_s)

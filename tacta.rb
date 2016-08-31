
def ask( prompt )
  print prompt
  gets.chomp
end

def index( contacts )
  contacts.each_with_index do |contact, i|
     puts "#{i+1}) #{contact[:name]}"
  end
end
=begin
make index number i
output 1) Thomas Jefferson  2) Charles Darwin ...
=end

def show ( contact )
  puts "#{contact[:name]}"
  puts "phone: #{contact[:phone]}"
  puts "email: #{contact[:email]}"
end

def create_new
  contact = {}

  puts
  puts "Enter contact info:"

  contact[:name] = ask "Name? "
  contact[:phone] = ask "Phone? "
  contact[:email] = ask "Email? "

  contact
end

def action_new( contacts )
  contact = create_new

  contacts << contact

  puts "New contact createted:"
  puts

  show( contact )
end

def action_show( contact, i )
  contact = contacts[i-1]

  show( contact )
end

def action_delete( contacts )
  puts
  response = ask "Delete which contact? "

  i= response.to_i

  puts "Contacts for #{contacts[i-1][:name]} deleted."

  contacts.delete_at( i-1 )
end

def action_error
  puts "Sorry, I don't recognize that command."
end

def action_search( contacts )
  puts
  pattern = ask "Search for? "

  contacts.each do |contact|
    if contact[:name] =~ /\b#{pattern}/i
      show( contact )
    end
  end
end

loop do
    index( contacts )
    # desplay method incex ( contacts )

    puts
    response = ask "Who would you like to see (n for new, d for delete, s for search, to quit)? "

    break if response == "q"

    if response == 'n'
      action_new( contacts )
    elsif response== 'd'
      action_delete( contacts )
    elsif response== "s"
      action_search( contacts )
    elsif response =~ /[0-9]+/
      action_show( contacts, response.to_i )
    else
      action_error
  end
end

puts
puts "Bye!"

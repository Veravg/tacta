

contacts = []
# start variablee empty (array)

contacts << { name: "Thomas Jefferson", phone: "+1 206 310 1369" , email: "tjeff@us.gov"       }
contacts << { name: "Charles Darwin"  , phone: "+44 20 7123 4567", email: "darles@evolve.org"  }
contacts << { name: "Nikola Tesla"    , phone: "+385 43 987 3355", email: "nik@inductlabs.com" }
contacts << { name: "Genghis Khan"    , phone: "+976 2 194 2222" , email: "contact@empire.com" }
contacts << { name: "Malcom X"        , phone: "+1 310 155 8822" , email: "x@theroost.org"     }

# add << contacten in contacts

def index( contacts )
  contacts.each_with_index do |contact, i|
     puts "#{i+1}) #{contact[:name]}"
  end
end
=begin
make index number i
output 1) Thomas Jefferson  2) Charles Darwin ...
=end

def ask( prompt )
  print prompt
  gets.chomp
end

def show ( contact )
  puts "#{contact[:name]}"
  puts "phone: #{contact[:phone]}"
  puts "email: #{contact[:email]}"
end

loop do
  index( contacts )
  # desplay method incex ( contacts )

  puts
  response = ask "Who would you like to see? "

  i = response.to_i
  # change array to integer   f (float) s (string)

  contact = contacts[i-1]

  puts
  show( contact )
  puts
end

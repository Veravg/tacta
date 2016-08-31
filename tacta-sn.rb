require 'sinatra'
require './contact_file'

set :port, 4567

get '/' do
  "<h1>Tacta Contact Manager</h1>"
end
# Start page

get '/contacts' do
  @contacts = read_contacts
  erb :'contacts/index'
end

post '/contacts' do
  # post is method, /contact is action_new
  # viewfile: form action="/contacts" method="POST"
  new_contact = { name: params[:name], phone: params[:phone], email: params[:email] }
  contacts = read_contacts
  contacts << new_contact
  write_contacts( contacts )
  i = contacts.length - 1
  redirect "/contacts/#{i}"
end

get '/contacts/new' do
   erb :'contacts/new'
end
# erb is the file type
# :'contacts/index' is the root (folder contacts, file index)

get '/contacts/:i' do
  @i = params[:i].to_i
  contacts = read_contacts
  @contact = contacts[@i]
  erb :'contacts/show'
end

get '/contacts/:i/edit' do
  @i = params[:i].to_i

  contacts = read_contacts
  @contact = contacts[@i]

  erb :'contacts/edit'
end

post '/contacts/:i/update' do
   i = params[:i].to_i

   updated_contact = { name: params[:name], phone: params[:phone], email: params[:email] }

   contacts = read_contacts
   contacts[i] = updated_contact
   write_contacts( contacts )

   redirect "/contacts/#{i}"
end

get '/contacts/:i/delete' do
  i = params[:i].to_i

  contacts = read_contacts
  contacts.delete_at( i )
  write_contacts( contacts )
  redirect "/contacts"
end

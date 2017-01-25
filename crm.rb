# Implement the new web-based CRM here.
# Do NOT copy the CRM class from the old crm assignment, as it won't work at all for the web-based version!
# You'll have to implement it from scratch.

require_relative 'contact'
require 'sinatra'

Contact.create('Marty', 'McFly', 'marty@mcfly.com', '')
Contact.create('George', 'McFly', 'george@mcfly.com', '')
Contact.create('Lorraine', 'McFly', 'lorraine@mcfly.com', '')
Contact.create('Biff', 'Tannen', 'biff@tannen.com', '')
Contact.create('Doc', 'Brown', 'doc@brown.com', '')

get '/' do
  @crm_app_name = "Bitmaker CRM"
  erb :index
end

get '/contacts' do
  erb :contacts
end

get '/new_contact' do
  erb :new_contact
end

post '/contacts' do
  Contact.create(params[:first_name], params[:last_name], params[:email], params[:note])
  redirect to('/')
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  erb :show_contact
end

require 'sinatra'
require 'sinatra/activerecord'
require 'bundler/setup'
require 'rack-flash'
enable :sessions
use Rack::Flash, :sweep => true

set :database, "sqlite3:dogdata.sqlite3"

require './models'

get '/' do 
	"Hello World"
end

get '/home' do
	erb :home
end

get '/about' do 
	erb :about
end

get '/sign-in' do
	erb :sign_in
end

get '/sign-up' do
	erb :sign_up 
end

get'/form' do
	erb :form
end

get 'posts/new' do
	erb :save
end


post '/sign-in' do
	@owner = Owner.where(username: params[:username]).first
	if @user.password == params[:password]
		flash[:notice] = "You've been signed in successfully"
		redirect "/home"
	else
		flash[:notice] = "There was a problem logging you in."
		redirect "login-failed"
	end
end

post '/sign-up' do
	@owner = Owner.new(params)
	if @owner.save
		flash[:notice] = "You've been signed up successfully"
		redirect '/home'
	else
		flash[:notice] = "There was a problem signing you up."
		redirect "sign_up"
	end
end
# 
post '/form' do 
	@post = Post.new(params[:post])
	@post.id = @current_user.id
	if @post.save
	else
		redirect '/save'
end 
end

#Old Method
#@post = Post.new(title: params[:title], text: 
#params[:text])

set :sessions, true 

set sessions[:owner_id] = @owner.id

def current_user
	if session[:owner_id]
		@current_owner = Owner.find(sessions[:owner_id])
	end
end

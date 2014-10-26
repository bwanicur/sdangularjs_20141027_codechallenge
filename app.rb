require 'sinatra'
require 'active_record'
require 'json'

if [:development, :test].include?(settings.environment)
  require 'pry'
  require 'pry-byebug'
end

configure :production, :development do
	db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/sdangularjs_development')

	ActiveRecord::Base.establish_connection(
			:adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
			:host     => db.host,
			:username => db.user,
			:password => db.password,
			:database => db.path[1..-1],
			:encoding => 'utf8'
	)
end

# models
require './models/presentation'

enable :logging, :dump_errors, :raise_errors unless ENV['RACK_ENV'] == 'production'

before do
  halt(403, 'Not Authorized') unless params[:token] == 'SD-AngularJS'
end

get '/presentations' do
  content_type :json
  Presentation.all.order("created_at DESC").to_json
end

get '/presentations/:id' do
  content_type :json
  Presentation.where(id: params[:id]).first.to_json
end

post '/presentations' do
  content_type :json
  presentation_atts = JSON.parse(request.body.read)['presentation']
  presentation = Presentation.new(presentation_atts)
  if presentation.save
    presentation.to_json
  else
    {errors: presentation.errors}.to_json
  end
end

patch '/presentations/:id' do
  content_type :json
  presentation = Presentation.where(id: params[:id]).first
  presentation_atts = JSON.parse(request.body.read)['presentation']
  if presentation.update_attributes(presentation_atts)
    presentation.to_json
  else
    {errors: presentation.errors}.to_json
  end
end

delete '/presentation/:id' do
  content_type :json
  presentation = Presentation.where(id: params[:id]).first
  if presentation && presentation.destroy
    {msg: 'success'}.to_json
  else
    {msg: 'there was a problem deleting the presentation'}
  end
end

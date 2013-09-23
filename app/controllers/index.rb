get '/' do
  # Look in app/views/index.erb
  erb :index, layout: false
end

require("sinatra")
require("sinatra/reloader")
require('pry')
also_reload("lib/**/*.rb")
require("./lib/tamagotchi")

get('/') do
  @tama_farm = Tamagotchi.pets()
  erb(:index)
end

post('/tamagotchi') do
  name = params.fetch('tamagotchi')
  @tamagotchi = Tamagotchi.new(name)
  erb(:tamagotchi)
end

post('/alive') do
  name = params.fetch('alive')
  @current_tama = ''
  @tama_farm = Tamagotchi.pets()
  @tama_farm.each() do |tama|
    if tama.name() == name
      @current_tama = tama
    else
      'No Tamagotchi with that name!'
    end
  end
  erb(:alive)
end

get('/feed') do
  @current_tama.feed()
end

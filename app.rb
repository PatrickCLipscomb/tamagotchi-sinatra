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
      @current_tama.prepare()
    end
  end
  erb(:alive)
end

post('/feed') do
  @pick = params.fetch('pick')
  @current_tama = ''
  @tama_farm = Tamagotchi.pets()
  @tama_farm.each() do |tama|
    if tama.name() == @pick
      @current_tama = tama
      @current_tama.prepare()
    end
  end
  food = params.fetch('food').to_i
  rest = params.fetch('rest').to_i
  play = params.fetch('play').to_i
  @current_tama.feed(food)
  @current_tama.sleep(rest)
  @current_tama.play(play)
  erb(:alive)
end

require('rspec')
require('tamagotchi')

describe(Tamagotchi) do
  describe('#initialize') do
    it('will create a new tamagotchi with name and vitals')
    my_pet = Tamagotchi.new('Tammy')
    expect(my_pet.name()).to(eq('Tammy'))
    expect(my_pet.food()).to(eq(5))
    expect(my_pet.play()).to(eq(5))
    expect(my_pet.rest()).to(eq(5))
  end

  describe('#alive?') do
    it('determines if pet is still alive') do
      my_pet = Tamagotchi.new('Tammy')
      expect(my_pet.alive?()).to(eq(true))
    end
  end
  describe('#fight') do
    it('will decrease health of target pet by attack') do
      expect(my_pet.health()).to(eq(8))
    end
   end
  describe('#feed') do
    it('will increase food level by 2') do
      expect(my_pet.food).to(eq(7))
    end
  end

end

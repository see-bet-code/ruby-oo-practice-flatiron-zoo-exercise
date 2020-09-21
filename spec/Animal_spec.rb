require 'spec_helper'

describe 'Animal' do
    before(:each) do
        Animal.all.clear
        Zoo.all.clear
    end
    
    it '#nickname' do
        baby = Animal.new("Hippo", 250, "Fiona")
        expect(baby.nickname).to eq("Fiona")
    end

    it '#weight' do
        baby = Animal.new("Hippo", 250, "Fiona")
        baby.weight += 1
        expect(baby.weight).to eq(251)
    end

    it '#species' do
        baby = Animal.new("Hippo", 250, "Fiona")
        expect(baby.species).to eq("Hippo")
    end

    it '.all' do
        baby = Animal.new("Hippo", 250, "Fiona")
        chef = Animal.new("Rat", 2, "Ratatouille")
        expect(Animal.all).to eq([baby, chef])
    end

    it '#zoo' do
        baby = Animal.new("Hippo", 250, "Fiona")
        chef = Animal.new("Rat", 2, "Ratatouille")
        ohio = Zoo.new("Cincinatty Zoo", "Ohio")
        paris = Zoo.new("Paris Special Chef Zoo", "France")
        baby.zoo = ohio
        chef.zoo = paris
        expect(baby.zoo).to eq(ohio)
        expect(chef.zoo).to eq(paris)
    end

    it '.find_by_species(species)' do
        baby = Animal.new("Hippo", 250, "Fiona")
        mom = Animal.new("Hippo", 250, "Fiona's Mom")
        chef = Animal.new("Rat", 2, "Ratatouille")
        expect(Animal.find_by_species("Hippo")).to eq([baby, mom])
        expect(Animal.find_by_species("Rat")).to eq([chef])
    end

end
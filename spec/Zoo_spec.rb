require 'spec_helper'

describe 'Zoo' do
    before(:each) do
        Animal.all.clear
        Zoo.all.clear
    end

    it '#location' do
        ohio = Zoo.new("Cincinatty Zoo", "USA")
        expect(ohio.location).to eq("USA")
    end

    it '#name' do
        ohio = Zoo.new("Cincinatty Zoo", "USA")
        expect(ohio.name).to eq("Cincinatty Zoo")
    end

    it '.all' do
        ohio = Zoo.new("Cincinatty Zoo", "USA")
        paris = Zoo.new("Paris Special Chef Zoo", "France")
        expect(Zoo.all).to eq([ohio, paris])
    end

    it '#animal_species' do
        baby = Animal.new("Hippo", 250, "Fiona")
        mom = Animal.new("Hippo", 250, "Bebe")
        chef = Animal.new("Rat", 2, "Ratatouille")
        ohio = Zoo.new("Cincinatty Zoo", "Ohio")
        paris = Zoo.new("Paris Special Chef Zoo", "France")
        baby.zoo = ohio
        mom.zoo = ohio
        chef.zoo = paris
        expect(ohio.animal_species).to eq(["Hippo"])
        expect(paris.animal_species).to eq(["Rat"])
    end

    it '#find_by_species(species)' do
        baby = Animal.new("Hippo", 250, "Fiona")
        mom = Animal.new("Hippo", 250, "Bebe")
        chef = Animal.new("Rat", 2, "Ratatouille")
        ohio = Zoo.new("Cincinatty Zoo", "Ohio")
        paris = Zoo.new("Paris Special Chef Zoo", "France")
        baby.zoo = ohio
        mom.zoo = ohio
        chef.zoo = paris
        expect(ohio.find_by_species("Hippo")).to eq([baby, mom])
        expect(paris.find_by_species("Rat")).to eq([chef])
    end

    it '#animal_nicknames' do
        baby = Animal.new("Hippo", 250, "Fiona")
        mom = Animal.new("Hippo", 250, "Bebe")
        chef = Animal.new("Rat", 2, "Ratatouille")
        ohio = Zoo.new("Cincinatty Zoo", "Ohio")
        paris = Zoo.new("Paris Special Chef Zoo", "France")
        baby.zoo = ohio
        mom.zoo = ohio
        chef.zoo = paris
        expect(ohio.animal_nicknames).to eq(["Fiona", "Bebe"])
        expect(paris.animal_nicknames).to eq(["Ratatouille"])
    end

    it '.find_by_location' do
        ohio = Zoo.new("Cincinatty Zoo", "USA")
        bronx = Zoo.new("Bronx Zoo", "USA")
        paris = Zoo.new("Paris Special Chef Zoo", "France")
        expect(Zoo.find_by_location("USA")).to eq([ohio, bronx])
        expect(Zoo.find_by_location("France")).to eq([paris])
    end

    

    

end
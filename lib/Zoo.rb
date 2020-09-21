class Zoo
    attr_accessor :name, :location
    @@all = []

    def initialize(name, location)
        @name = name
        @location = location
        @@all << self
    end

    def animals
        Animal.all.select { |a| a.zoo == self }
    end

    def self.all
        @@all
    end

    def animal_species
        self.animals.map { |a| a.species }.uniq
    end

    def find_by_species(species)
        self.animals.select {|a| a.species == species }
    end

    def animal_nicknames
        self.animals.map { |a| a.nickname }
    end

    def self.find_by_location(location)
        self.all.select {|zoo| zoo.location == location }
    end
end

class Animal
    attr_accessor :weight, :zoo
    attr_reader :species, :nickname
    @@all = []

    def initialize(species, weight, nickname)
        @species = species
        @nickname = nickname
        @weight = weight
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_species(species)
        self.all.select {|a| a.species == species }
    end

end

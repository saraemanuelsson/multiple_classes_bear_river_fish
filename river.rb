class River

    attr_reader :name, :fish

    def initialize(name, fish)
        @name = name
        @fish = fish
    end

    def river_fish_count()
        return @fish.length
    end

    def add_fish_to_river(fish)
        @fish << fish
    end

    def remove_fish_from_river()
        @fish.pop()
    end

end
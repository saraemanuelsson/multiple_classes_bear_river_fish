class Bear

    attr_reader :name, :type, :stomach

    def initialize(name, type)
        @name = name
        @type = type
        @stomach = []
        @belly_capacity = 5
    end

    def eat_fish(fish)
        @stomach << fish
    end

    def belly_fish_count()
        return @stomach.length
    end

    def hunt_fish(river)
        
        if river.river_fish_count > 0 && belly_fish_count < @belly_capacity
            fish = river.remove_fish_from_river()
            eat_fish(fish)
        end

    end
    
end
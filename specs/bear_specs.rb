require('minitest/autorun')
require('minitest/reporters')

require_relative('../bear')
require_relative('../river')
require_relative('../fish')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestBear < MiniTest::Test

    def setup()

        @bear = Bear.new("Paddington", :teddy)

    end

    def test_bear_name()
        assert_equal("Paddington", @bear.name())
    end

    def test_bear_type()
        assert_equal(:teddy, @bear.type())
    end

    def test_belly_fish_count()
        assert_equal(0, @bear.belly_fish_count())
    end

    def test_can_hunt_fish()
        fish1 = Fish.new("Nemo")
        fish2 = Fish.new("Dory")
        fish3 = Fish.new("Flounder")
        river = River.new("Water of Leith", [fish1, fish2, fish3])
        @bear.hunt_fish(river)
        assert_equal(1, @bear.belly_fish_count)
        assert_equal(2, river.river_fish_count())
    end

    def test_will_not_hunt_if_not_hungry()
        fish1 = Fish.new("Nemo")
        fish2 = Fish.new("Dory")
        fish3 = Fish.new("Flounder")
        fish4 = Fish.new("Flipper")
        fish5 = Fish.new("Willy")
        river = River.new("Water of Leith", [fish1, fish2, fish3])
        @bear.eat_fish(fish1)
        @bear.eat_fish(fish2)
        @bear.eat_fish(fish3)
        @bear.eat_fish(fish4)
        @bear.eat_fish(fish5)
        @bear.hunt_fish(river)
        assert_equal(5, @bear.belly_fish_count)
    end

    def test_can_not_hunt_if_no_fish_in_river()
        river = River.new("Water of Leith", [])
        @bear.hunt_fish(river)
        assert_equal(0, @bear.belly_fish_count())
    end

end
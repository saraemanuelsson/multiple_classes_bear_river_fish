require('minitest/autorun')
require('minitest/reporters')

require_relative('../river')
require_relative('../fish')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestRiver < MiniTest::Test

    def setup()

        @fish1 = Fish.new("Nemo")
        @fish2 = Fish.new("Dory")

        fish = [@fish1, @fish2]

        @river = River.new("Water of Leith", fish)
       
        @new_fish = Fish.new("Flounder")

    end

    def test_river_name()
        assert_equal("Water of Leith", @river.name())
    end

    def test_number_of_fish_in_river()
        assert_equal(2, @river.river_fish_count())
    end

    def test_add_fish_to_river()
        @river.add_fish_to_river(@new_fish)
        assert_equal(3, @river.river_fish_count())
    end

    def test_remove_fish_from_river()
        @river.remove_fish_from_river()
        assert_equal(1, @river.river_fish_count())
    end

end
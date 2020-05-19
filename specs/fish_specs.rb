require('minitest/autorun')
require('minitest/reporters')

require_relative('../fish')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestFish < MiniTest::Test

    def setup()

        @fish = Fish.new("Nemo")

    end

    def test_fish_name()
        assert_equal("Nemo", @fish.name())
    end

end
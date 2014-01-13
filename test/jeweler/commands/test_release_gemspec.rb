require 'test_helper'

class Jeweler
  module Commands
    class TestWriteGemspec < Test::Unit::TestCase
      should "abort when there are unstaged changes"
      should "commits when there are no changes"
    end
  end
end
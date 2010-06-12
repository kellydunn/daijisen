<<<<<<< HEAD
require 'helper'

class TestDaijisen < Test::Unit::TestCase
  should "probably rename this file and start testing for real" do
    flunk "hey buddy, you should probably rename this file and start testing for real"
  end
end
=======
require File.dirname(__FILE__) + '/test_helper.rb'

class TestDaijisen < Test::Unit::TestCase

  def setup
  end
  
  def test_truth
    assert true
  end
end
>>>>>>> origin/master

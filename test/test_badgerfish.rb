require File.expand_path '../test_helper.rb', __FILE__

class TestBadgerfish < Minitest::Test
  def setup
    @parser = Badgerfish::Parser.new
  end
end

# require and include all mabmapper test modules
Dir.glob(File.expand_path '../badgerfish/test_*.rb', __FILE__).each do |filename|
  require filename
  TestBadgerfish.instance_eval do
    include File.basename(filename, '.rb').camelize.constantize
  end
end

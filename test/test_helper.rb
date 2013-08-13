# silence that minitest related error about minitest/autorun (since minitest version >= 5)
gem 'minitest'

require 'badgerfish'
require 'minitest/autorun'
require 'multi_json'
require 'pry'

def assert_badgerfish(xml, json)
  json = MultiJson.dump(MultiJson.load(json)) # sanitize json
  badgerfish_json = MultiJson.dump(@parser.load(xml))

  assert_equal(json, badgerfish_json)
end

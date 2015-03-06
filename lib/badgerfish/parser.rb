require 'badgerfish/ox_sax_parser'

module Badgerfish
  class Parser

    def initialize
      @parser = Badgerfish::OxSaxParser.new
    end

    def load(xml, options = {})
      @parser.load(xml, options)
    end

  end
end

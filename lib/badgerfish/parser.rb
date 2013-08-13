require 'badgerfish/ox_sax_parser'

module Badgerfish
  class Parser

    def initialize()
      @parser = Badgerfish::OxSaxParser.new
    end

    def load(xml)
      @parser.load(xml)
    end

  end
end

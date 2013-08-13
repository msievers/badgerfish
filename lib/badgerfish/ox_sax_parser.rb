require 'ox'
require 'stringio'

module Badgerfish
  class OxSaxParser < Ox::Sax

    def load(xml)
      @result = @root = {}
      @parents = []
      Ox.sax_parse(self, StringIO.new(xml))
      @result
    end

    #
    # sax callbacks
    #
    def start_element(name)
      new_element = {}
      name = name.to_s # force string representation of symbols

      if @root[name].nil?
        @root[name] = new_element
      else
        @root[name] = [@root[name]] unless @root[name].is_a?(Array)
        @root[name].push new_element
      end

      @parents.push @root
      @root = new_element
    end

    def end_element(name)
      @root = @parents.pop
    end

    def attr(name, value)
      unless name.to_s.start_with? 'xmlns'
        @root["@#{name}"] = value
      else
        @root['@xmlns'] ||= {}

        if name.to_s.start_with? 'xmlns:'
          @root['@xmlns'][name[6, name.length]] = value
        else
          @root['@xmlns']['$'] = value
        end
      end
    end

    def text(value)
      @root['$'] = value
    end

  end
end

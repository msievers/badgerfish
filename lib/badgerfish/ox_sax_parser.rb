require 'htmlentities'
require 'ox'
require 'stringio'

module Badgerfish
  class OxSaxParser < Ox::Sax

    def load(xml, options = {})
      @decode_html_entities =
      if options[:decode_html_entities].nil?
        true
      else
        !!options[:decode_html_entities]
      end

      @html_entities_coder = HTMLEntities.new
      @remove_namespaces = !!options[:remove_namespaces]
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
        @root[name] << new_element
      end

      @parents << @root
      @root = new_element
    end

    def end_element(name)
      (@root = @parents.pop).inject(@root) do |hash, (key, value)|
        hash[key] = nil if value.nil? || value.empty?
        hash
      end
    end

    def attr(name, value)
      if @remove_namespaces || !name.to_s.start_with?('xmlns')
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
      @root['$'] = @decode_html_entities ? @html_entities_coder.decode(value) : value
    end
  end
end

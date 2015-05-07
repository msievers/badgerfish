# Badgerfish [![Build Status](https://travis-ci.org/msievers/badgerfish.png)](https://travis-ci.org/msievers/badgerfish) [![Dependency Status](https://gemnasium.com/msievers/badgerfish.png)](https://gemnasium.com/msievers/badgerfish)

BadgerFish is a convention for translating an XML document into a JSON object.

The rules

* element names become object properties
* text content of elements goes in the $ property of an object
* nested elements become nested properties
* multiple elements at the same level become array elements
* attributes go in properties whose names begin with @
* active namespaces for an element go in the element's @xmlns property
* the default namespace URI goes in @xmlns.$
* other namespaces go in other properties of @xmlns
* elements with namespace prefixes become object properties, too

## Installation

Add this line to your application's Gemfile:

    gem 'badgerfish'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install badgerfish

## Usage

```ruby
require 'badgerfish'

parser = Badgerfish::Parser.new
xml = '<alice charlie="david">bob</alice>'
badgerfish_hash = parser.load(xml)
```

## Missing features

Does not handle child node namespaces as suggested by http://badgerfish.ning.com (case 9).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Links

* http://badgerfish.ning.com
* http://wiki.open311.org/JSON_and_XML_Conversion/#the-badgerfish-convention

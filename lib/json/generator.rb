# encoding: utf-8

require "json/generator/version"

require "json/generator/basic_attribute"
require "json/generator/empty_attribute"
require "json/generator/string_attribute"
require "json/generator/integer_attribute"
require "json/generator/array_attribute"
require "json/generator/object_attribute"
require "json/generator/boolean_attribute"
require "json/generator/number_attribute"
require "json/generator/attribute_factory"
require "json/generator/dereferencer"
require "hash_deep_merge"

module JSON
  module Generator
    def self.generate(schema, merge_hash = {})
      dereferenced_schema = Dereferencer.dereference(schema)
      result = AttributeFactory.create(dereferenced_schema).generate
      result.deep_merge(merge_hash)
    end
  end
end

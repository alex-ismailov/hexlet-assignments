# # frozen_string_literal: true

# BEGIN
module Model
  def self.included(base)
    base.extend(ClassMethods)
  end

  attr_accessor :attributes

  def initialize(attributes = {})
    @attributes = {}

    self.class.attr_options.each do |name, options|
      value = attributes.key?(name) ? attributes[name] : options.fetch(:default, nil)
      options = self.class.attr_options[name]
      @attributes[name] = self.class.convert_to_type(value, options[:type])
    end
  end

  def attributes
    @attributes.each_with_object({}) do |attr, acc|
      key, value = attr
      acc[key] = value
    end
  end

  module ClassMethods
    attr_reader :attr_options

    def convert_to_type(value, type)
      return nil if value.nil?

      case type
      when :integer
        Integer value
      when :string
        String value
      when :datetime
        DateTime.parse(value)
      when :boolean
        value.to_s == 'true'
      else
        value
      end
    end

    def attribute(name, options = {})
      @attr_options ||= {}
      @attr_options[name] = options

      define_method "#{name}" do
        @attributes[name]
      end

      define_method "#{name}=" do |value|
        options = self.class.attr_options[name]
        @attributes[name] = self.class.convert_to_type(value, options[:type])
      end
    end
  end
end
# END

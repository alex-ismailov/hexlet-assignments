# frozen_string_literal: true

# BEGIN
module Model
  def self.included(base)
    base.extend(ClassMethods)
  end

  attr_accessor :attrs

  def initialize(attrs = {})
    @attrs = {}

    self.class.attr_options.each do |name, options|
      value = attrs.key?(name) ? attrs[name] : options.fetch(:default, nil)
      @attrs[name] = self.class.convert_to_type(value, options[:type])
    end
  end

  def attributes
    @attrs.each_with_object({}) do |attr, acc|
      name, value = attr
      acc[name] = value
    end
  end

  module ClassMethods
    attr_reader :attr_options

    def convert_to_type(value, type)
      return value if value.nil?

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

      define_method name.to_s do
        @attrs[name]
      end

      define_method "#{name}=" do |value|
        options = self.class.attr_options[name]
        @attrs[name] = self.class.convert_to_type(value, options[:type])
      end
    end
  end
end

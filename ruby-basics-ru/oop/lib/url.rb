# frozen_string_literal: true

# BEGIN
require 'forwardable'
require 'uri'

# class Url
#   extend Forwardable

#   def_delegators(:@url, :scheme, :host, :port, :to_s)

#   def initialize(address)
#     @url = URI(address)
#   end

#   def query_params
#     query_string = @url.query
#     return {} if query_string.to_s.empty?

#     pairs = query_string.split('&')
#     obj = pairs.each_with_object({}) do |pair, acc|
#       key, value = pair.split('=')
#       acc[key] = value
#     end
#     obj.transform_keys(&:to_sym)
#   end

#   def query_param(key, default_value = nil)
#     params = query_params
#     return default_value unless params.key? key

#     params[key]
#   end

#   def ==(url_to_compare)
#     url_scheme = url_to_compare.scheme
#     url_host_name = url_to_compare.host
#     url_port = url_to_compare.port
#     url_host_name = "#{url_scheme}://#{url_host_name}.#{url_port}"

#     self_scheme = scheme
#     self_host_name = host
#     self_port = port
#     self_host_name = "#{self_scheme}://#{self_host_name}.#{self_port}"

#     self_params = query_params
#     passed_params = url_to_compare.query_params

#     key_diff = self_params.keys - passed_params.keys
#     value_diff = self_params.values - passed_params.values

#     is_empty_params = key_diff.empty? && value_diff.empty?

#     url_host_name == self_host_name && is_empty_params
#   end
# end
# END

# Hexlet solution
class Url
  include Comparable
  extend Forwardable

  def_delegators :@uri, :host, :scheme, :port

  def initialize(url)
    @uri = URI.parse(url)
    query = @uri.query || ''
    @params = query
              .split('&')
              .each_with_object({}) do |query_parts, acc|
                key, value = query_parts.split '='
                acc[key.to_sym] = value
              end
  end

  def query_params
    @params
  end

  def query_param(key, default = nil)
    @params.fetch(key, default)
  end

  def <=>(other)
    [scheme, host, port, query_params] <=> [other.scheme, other.host, other.port, other.query_params]
  end
end

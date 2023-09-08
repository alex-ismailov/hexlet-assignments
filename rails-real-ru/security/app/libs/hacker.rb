# frozen_string_literal: true

require 'open-uri'

require 'nokogiri'

require 'net/http'
require 'net/https'


class Hacker
  class << self
    def hack(email, password)
      # BEGIN
      sign_up_page_link = 'https://rails-collective-blog-ru.hexlet.app/users/sign_up'
      new_user_link = 'https://rails-collective-blog-ru.hexlet.app/users'

      sign_up_uri = URI(sign_up_page_link)
      new_user_uri = URI(new_user_link)

      http_connection = Net::HTTP.start(sign_up_uri.host, sign_up_uri.port, use_ssl: (sign_up_uri.scheme == 'https'))
      # http_connection = Net::HTTP.start(sign_up_uri.host, sign_up_uri.port)

      # http_connection.use_ssl = sign_up_uri.scheme == 'https'
      http_connection.verify_mode = OpenSSL::SSL::VERIFY_NONE

      get_response = http_connection.get(sign_up_uri.path)

      document = Nokogiri::HTML(get_response.body);
      # meta_element = document.at('meta[name="csrf-token"]')
      # meta_element = document.at_css('meta[name="csrf-token"]')
      # debugger
      # token = meta_element['content']
      # token = meta_element.attr('content')
      # token = meta_element.content
      element = document.at('input[name="authenticity_token"]')
      # element = document.at_css('input[name="authenticity_token"]')
      authenticity_token = element['value']
      # authenticity_token = element.attr('value')

      session_cookies = get_response.get_fields('Set-Cookie').split('; ').first

      params = {
        authenticity_token: authenticity_token,
        user: {
          email: email,
          password: password,
          password_confirmation: password,
        },
        commit: 'Регистрация'
      }

      post_request = Net::HTTP::Post.new(new_user_uri.path)
      post_request['Cookie'] = session_cookies.first.split('; ').first
      post_request.body = URI.encode_www_form(params)
      post_request['Content-Type'] = 'application/x-www-form-urlencoded;charset=UTF-8'
      # post_request['X-Csrf-Token'] = token
      post_request['Referer'] = 'https://rails-collective-blog-ru.hexlet.app/users/sign_up'
      post_request['User-Agent'] = 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Mobile Safari/537.36'
      post_request['Origin'] = 'https://rails-collective-blog-ru.hexlet.app'
      post_request[':authority'] = 'rails-collective-blog-ru.hexlet.app'

      post_response = http_connection.request(post_request)

      post_response.body
      
      post_response
    end  
  end
end

# frozen_string_literal: true

require 'test_helper'

class Web::RepositoriesControllerTest < ActionDispatch::IntegrationTest
  # BEGIN
  test 'should_create' do
    stub_response_data = {body: load_fixture('files/response.json')}
    stub_request(:get, "http://[https//github.com%5D:80/alex-ismailov").
      to_return_json(stub_response_data)

    response = Net::HTTP.get('https://github.com', '/alex-ismailov')

    refute_nil(response)
    assert_equal(stub_response_data[:body], response)
    # byebug
  end
  # END
end

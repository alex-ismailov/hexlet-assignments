# frozen_string_literal: true

class Article < ApplicationRecord
  # BEGIN
  # def competing_price
  #   Rails.cache.fetch("#{cache_key_with_version}/competing_price", expires_in: 12.hours) do
  #     Competitor::API.find_price(id)
  #   end
  # end

  # def last_reading_date_DRAFT
  #   Rails.cache.fetch("last_reading_date_#{id}", expires_in: 12.hours) do
  #     Time.current
  #   end
  # end

  def last_reading_date
    Rails.cache.fetch("#{cache_key_with_version}/artcle", expires_in: 12.hours) do
      Time.current
    end
  end
  # END
end

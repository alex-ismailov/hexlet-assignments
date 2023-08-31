# frozen_string_literal: true

require 'csv'
require 'date'

first_row_skipped = false

namespace :hexlet do
  desc 'TODO'
  task :import_users, [:path] => :environment do |_user, args|
    path = args[:path]
    CSV.foreach(path) do |first_name, last_name, birthday, email|
      if first_row_skipped
        parsed_birthday = Date.strptime(birthday, '%m/%d/%Y')
        User.create(first_name:, last_name:, birthday: parsed_birthday, email:)
      else
        first_row_skipped = true
      end
    end
  end
end

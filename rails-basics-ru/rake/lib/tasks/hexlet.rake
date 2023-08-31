# frozen_string_literal: true

require 'csv'

first_row_skipped = false

namespace :hexlet do
  desc 'TODO'
  task :import_users, [:path] => :environment do |_user, args|
    path = args[:path]
    CSV.foreach(path) do |row|
      if first_row_skipped
        first_name, last_name, birthday, email = row
        birthday_value = birthday.nil? ? '1972-01-01' : birthday;
        User.create(first_name:, last_name:, birthday: birthday_value, email:)
      else
        first_row_skipped = true
      end
    end
  end
end

namespace :hexlet do
  desc "TODO"
  task :import_users, [:path] => :environment do |user, args|
    path = args[:path]
    CSV.foreach(path) do |row|
      if first_row_skipped
        first_name, last_name, birthday, email = row
        User.create(first_name: first_name, last_name: last_name, birthday: birthday  = '1972-01-01', email: email)
      else
        first_row_skipped = true
      end
    end
  end
end

# frozen_string_literal: true

class Repository < ApplicationRecord
  validates :link, presence: true, uniqueness: true

  # BEGIN
  include AASM

  # created — начальное состояние добавленного репозитория
  # fetching — при переходе в это состояние начинается загрузка данных о репозитории
  # fetched — переход в это состояние происходит при успешной загрузке информации о репозитории
  # failed — переход в состояние выполняется, при запросе информации произошла какая-либо ошибка
  aasm do
    state :created, initial: true
    state :fetching, :fetched, :failed

    event :fetch do
      transitions from: [:created, :fetched], to: :fetching
    end

    event :fetch_success do
      transitions from: :fetching, to: :fetched
    end

    event :fetch_fail do
      transitions from: :fetching, to: :failed
    end
  end
  # END
end

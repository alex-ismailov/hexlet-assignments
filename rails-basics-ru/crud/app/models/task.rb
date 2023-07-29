class Task < ApplicationRecord
  validates :name, :status, :creator, presence: true
  validates :completed, inclusion: [true, false]
end


# name - обязательное, строка. Название задачи
# description - необязательное. Описание задачи
# status - обязательное, строка. По умолчанию задача создается в новом статусе
# creator - обязательно, строка. Создатель задачи
# performer - необязательное, строка. Тот на кого поставлена задача
# completed - обязательное булево значение
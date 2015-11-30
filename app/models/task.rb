class Task < ActiveRecord::Base
  belongs_to :user, inverse_of: :tasks

  validates :user, presence: true
  validates :name, presence: true

  state_machine initial: :new do
    event :start do
      transition from: :new, to: :started
    end

    event :finish do
      transition from: :started, to: :finished
    end
  end
end

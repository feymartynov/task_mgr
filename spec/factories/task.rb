FactoryGirl.define do
  factory :task do
    sequence(:name) { |n| "Task #{n}" }
    description 'Some description'
    state 'finished'
    user
  end
end

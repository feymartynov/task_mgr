# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = %w(joe mike robert).map do |name|
  User.create!(email: "#{name}@example.com", password: 'qwerty123')
end

tasks = YAML.load(<<-YAML)
- name: Make a Rails app
  description: Use Rails and Bootstrap
  state: finished
- name: Create models
  description: Task (name, description, state, user), User (email, password)
  state: finished
- name: Write some seeds
  description: Add some fake users & tasks
  state: started
- name: Create Welcome page
  description: Just like that
  state: new
- name: Add authorization
  description: Allow users to access the private area
  state: new
- name: Make a tasks list page
  description: Show all tasks in the system and their owners
  state: new
- name: Allow users to change the task state
  description: One can change the state only of his own tasks, not the others'
  state: new
- name: Deploy on Heroku
  description: Use capistrano. Also set up travis ci.
  state: new
YAML

tasks.each do |attrs|
  Task.create!(attrs.merge(user: users.sample))
end

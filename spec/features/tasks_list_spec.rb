require 'rails_helper'

describe 'tasks list' do
  let!(:user) { create(:user) }
  before { login_as(user) }

  def find_task(task)
    find('h4', text: task.name).parent
  end

  it 'should show tasks' do
    tasks = create_list(:task, 5)
    visit '/tasks'
    tasks.each { |task| expect(page).to have_text(task.name) }
  end

  it 'should start the task' do
    task = create(:task, state: :new, user: user)
    visit '/tasks'
    within(find_task(task)) { click_button 'Start' }
    expect(find_task(task)).to have_text('started')
  end

  it 'should finish the task' do
    task = create(:task, state: :started, user: user)
    visit '/tasks'
    within(find_task(task)) { click_button 'Finish' }
    expect(find_task(task)).to have_text('finished')
  end

  it 'should forbid from touching other user\'s task' do
    task = create(:task, state: :new)
    page.driver.post(start_task_path(task))
    expect(page.driver.status_code).to eq(403)
  end
end

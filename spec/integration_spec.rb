require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('launchy')

describe('adding a new division', {:type => :feature}) do
  it('allows a user to add a division') do
    visit('/')
    click_link('Add new division')
    fill_in('name', :with =>'HR')
    click_button('Add division')
    expect(page).to have_content('HR')
  end

  it('allows the user to view individual division page') do
    visit('/')
    click_link('Add new division')
    fill_in('name', :with =>'HR')
    click_button('Add division')
    click_link('HR')
    expect(page).to have_content('Individual division page')
  end
end

describe('update a division', {:type => :feature}) do
  it('allows a user to update the name of a division') do
    visit('/')
    click_link('Add new division')
    fill_in('name', :with =>'HR')
    click_button('Add division')
    click_link('HR')
    click_link('Update')
    fill_in('name', :with => "Legal")
    click_button('Update')
    expect(page).to have_content("Legal")
  end

  it('allows a user to delete a division') do
    visit('/')
    click_link('Add new division')
    fill_in('name', :with =>'HR')
    click_button('Add division')
    click_link('HR')
    click_link('Update')
    click_button('Delete')
    expect(page).to have_content("Current Divisions")
  end
end


describe('adding a new employee', {:type => :feature}) do
  it('allows a user to add an employee to a division') do
    visit('/')
    click_link('Add new division')
    fill_in('name', :with =>'HR')
    click_button('Add division')
    expect(page).to have_content('HR')
    visit('/')
    click_link('Add new employee')
    fill_in('name', :with =>'Jane')
    click_button('Add employee')
    expect(page).to have_content('Jane')
  end

  it('allows a user to edit the employees name') do
    visit('/')
    click_link('Add new division')
    fill_in('name', :with =>'HR')
    click_button('Add division')
    visit('/')
    click_link('Add new employee')
    fill_in('name', :with =>'Jane')
    click_button('Add employee')
    click_link('Jane')
    fill_in('name', :with => 'Janet')
    click_button('Update')
    expect(page).to have_content('Janet')
  end

  it('allows a user to delete an employee')do
    visit('/')
    click_link('Add new division')
    fill_in('name', :with =>'HR')
    click_button('Add division')
    visit('/')
    click_link('Add new employee')
    fill_in('name', :with =>'Jane')
    click_button('Add employee')
    click_link('Jane')
    click_button('Delete')
    expect(page).to have_content('Current Employees')
  end
end

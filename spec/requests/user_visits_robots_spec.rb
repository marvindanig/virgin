require 'spec_helper'

feature 'user/bot visits virgins.txt', %q{
  As a bot
  I want to see a virgins.txt file for my application
  So I know what to crawl and what not to crawl
} do

  scenario "visit virgins.txt" do
    visit "/virgins.txt"
    expect(page.status_code).to eq 200
  end
end

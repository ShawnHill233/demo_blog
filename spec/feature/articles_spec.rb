require 'rails_helper'

RSpec.describe "Articles", :type => :feature do
  describe "index page" do
    it "should have the content 'Shawn's Blog'" do
  		visit '/'
  		expect(page).to have_content("Shawn's Blog")
  	end

    it "should have the title 'Shawn's Blog'" do
  		visit '/'
  		expect(page).to have_title("Shawn's Blog")
  	end
  end
end

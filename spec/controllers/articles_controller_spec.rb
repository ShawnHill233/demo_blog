require 'rails_helper'

RSpec.describe "Articles", :type => :feature do
  describe "index page" do

    subject { page }
    before { visit root_path }

    it { should have_content("Shawn's Blog") }
    it { should have_title(full_title(""))}
    it { should_not have_title('| Home')}    

    it "should redirect to root_path while clink header Blog link" do
    	click_link "Shawn's Blog"
    	expect(page.current_path).to eq root_path
    end
  end

end

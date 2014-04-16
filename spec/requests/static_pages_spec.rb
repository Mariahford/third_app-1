require 'spec_helper'

describe "StaticPages" do

  subject { pages}

  describe "Home page" do
    before {visit root_path}
      
    it { should have_selector("h1", text: 'Sample App') }    
    it {should have_selector("title", text: 'Home Page') }
    end
  describe "Help page" do
    before  {visit help_path}

    it { should have_selector("h1", text: 'Help Page ') }    
    it {should have_selector("title", text: 'Help Page') }
    end
  describe "About Us page" do
    before  {visit about_path}

    it { should have_selector("h1", text: 'About Us') }    
    it {should have_selector("title", text: 'About Page') }
    end
   describe "Contact page" do
    before  {visit contact_path}

      it { should have_selector("h1", text: 'Contact Us') }    
    it {should have_selector("title", text: 'Contact Page') }
    end
    it "should have the correct links" do 
    visit root_path
    click_link "About"
    page.should have_selector 'tilte', title: "About us"
    click_link "Help"
    page.should have_selector 'tilte', title: "Help"
    click_link "Contact"
    page.should have_selector 'tilte', title: "Contact"
    click_link "Home"
    click_link "Sign up now!"
    page.should have_selector 'tilte', title: "Sign up"

end



Ruby1.9.3/lib/ruby/gems/1.9.1/gems/actionpack-3.2.13/lib/action_dispatch/routing/mapper.rb:179:in `default_controller_and_action': missing :action (ArgumentError)


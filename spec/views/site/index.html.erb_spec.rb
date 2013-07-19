require 'spec_helper'

describe "Home Page" do
  it "should have a link to sign in" do
  	visit "/"
  	expect(page).to have_link("Sign In")
  end

  it "should have the header HB Note" do
  	visit "/"
  	expect(page).to have_selector('h1', :text => "HB Note")
	end
end

describe "Sign Up Page" do
	it "should have the header Sign Up" do
		visit new_user_registration_path
		expect(page).to have_selector('h2', :text => "Sign up")
	end

	it "should have a username field" do
		visit new_user_registration_path
		expect(page).to have_field("username")
	end
end


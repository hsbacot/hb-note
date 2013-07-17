require 'spec_helper'

describe "Home Page" do
  it "should have a link to sign in" do
  	visit "/"
  	expect(page).to have_link("Sign In")
  end
end

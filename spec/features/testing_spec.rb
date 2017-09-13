require "rails_helper"

feature "testing it works" do
  it "does the thing" do
    visit "/"
    click_link "Items"
    create(:item)
  end
end

require "rails_helper"

feature "testing it works" do
  it "does the thing" do
    visit "/"
    click_link "Items"
    save_and_open_page
    create(:item)
  end
end

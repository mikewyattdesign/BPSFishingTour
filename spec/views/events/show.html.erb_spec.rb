require 'spec_helper'

describe "events/show" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :name => "Name",
      :address => "Address",
      :address2 => "Address2",
      :city => "City",
      :province => "Province",
      :state => "State",
      :country => "Country"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Address/)
    rendered.should match(/Address2/)
    rendered.should match(/City/)
    rendered.should match(/Province/)
    rendered.should match(/State/)
    rendered.should match(/Country/)
  end
end

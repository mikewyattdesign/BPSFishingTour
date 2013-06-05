require 'spec_helper'

describe "events/edit" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :name => "MyString",
      :address => "MyString",
      :address2 => "MyString",
      :city => "MyString",
      :province => "MyString",
      :state => "MyString",
      :country => "MyString"
    ))
  end

  it "renders the edit event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", event_path(@event), "post" do
      assert_select "input#event_name[name=?]", "event[name]"
      assert_select "input#event_address[name=?]", "event[address]"
      assert_select "input#event_address2[name=?]", "event[address2]"
      assert_select "input#event_city[name=?]", "event[city]"
      assert_select "input#event_province[name=?]", "event[province]"
      assert_select "input#event_state[name=?]", "event[state]"
      assert_select "input#event_country[name=?]", "event[country]"
    end
  end
end

require 'spec_helper'

describe "events/new" do
  before(:each) do
    assign(:event, stub_model(Event,
      :name => "MyString",
      :address => "MyString",
      :address2 => "MyString",
      :city => "MyString",
      :province => "MyString",
      :state => "MyString",
      :country => "MyString"
    ).as_new_record)
  end

  it "renders new event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", events_path, "post" do
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

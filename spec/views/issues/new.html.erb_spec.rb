require 'rails_helper'

RSpec.describe "issues/new", type: :view do
  before(:each) do
    assign(:issue, Issue.new(
      title: "MyString",
      detail: "MyText",
      image: "MyString",
      cause: "MyText",
      goal: "MyText",
      gap: "MyText",
      priority: 1,
      status: 1,
      done_flag: false
    ))
  end

  it "renders new issue form" do
    render

    assert_select "form[action=?][method=?]", issues_path, "post" do

      assert_select "input[name=?]", "issue[title]"

      assert_select "textarea[name=?]", "issue[detail]"

      assert_select "input[name=?]", "issue[image]"

      assert_select "textarea[name=?]", "issue[cause]"

      assert_select "textarea[name=?]", "issue[goal]"

      assert_select "textarea[name=?]", "issue[gap]"

      assert_select "input[name=?]", "issue[priority]"

      assert_select "input[name=?]", "issue[status]"

      assert_select "input[name=?]", "issue[done_flag]"
    end
  end
end

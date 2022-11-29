require 'rails_helper'

RSpec.describe "issues/index", type: :view do
  before(:each) do
    assign(:issues, [
      Issue.create!(
        title: "Title",
        detail: "MyText",
        image: "Image",
        cause: "MyText",
        goal: "MyText",
        gap: "MyText",
        priority: 2,
        status: 3,
        done_flag: false
      ),
      Issue.create!(
        title: "Title",
        detail: "MyText",
        image: "Image",
        cause: "MyText",
        goal: "MyText",
        gap: "MyText",
        priority: 2,
        status: 3,
        done_flag: false
      )
    ])
  end

  it "renders a list of issues" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Image".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
  end
end

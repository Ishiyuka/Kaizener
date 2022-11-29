require 'rails_helper'

RSpec.describe "issues/show", type: :view do
  before(:each) do
    assign(:issue, Issue.create!(
      title: "Title",
      detail: "MyText",
      image: "Image",
      cause: "MyText",
      goal: "MyText",
      gap: "MyText",
      priority: 2,
      status: 3,
      done_flag: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Image/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/false/)
  end
end

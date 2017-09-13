require 'rails_helper'

RSpec.feature "root path works" do
  it "goes to the home page" do

    visit '/'

    expect(current_path).to eq root_path
  end
end

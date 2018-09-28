require 'spec_helper'
describe "My Recipe Application" do
  it "should allow get on home page" do
    get '/'
    expect(last_response).to be_ok
  end
end

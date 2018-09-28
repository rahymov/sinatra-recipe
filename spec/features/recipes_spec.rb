require 'spec_helper'
describe "Recipe controller" do
  it "should allow get index page" do
      get '/recipes/index'
    expect(last_response).to be_ok
  end
end

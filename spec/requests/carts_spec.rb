require 'rails_helper'

RSpec.describe "Carts", type: :request do
	user = FactoryGirl.create(:user)

 	it "should add line item " do 
    visit root_path
  end

end

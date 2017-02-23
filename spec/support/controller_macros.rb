module ControllerMacros

  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = User.new
      user.email = "rspec_admin@test.com"
      user.password = "123456"
      user.password_confirmation = "123456"
      user.admin = true
      user.save!
      sign_in user
    end
  end

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = User.new
      user.email = "rspec@test.com"
      user.password = "123456"
      user.password_confirmation = "123456"
      user.save!
      sign_in user
      # user = FactoryGirl.create(:user)
      # user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
      # sign_in user
    end
  end
end
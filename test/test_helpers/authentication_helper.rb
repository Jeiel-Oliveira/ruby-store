module AuthenticationHelper
  def login(user = users(:jeiel))
    post session_path, params: { email_address: user.email_address, password: "password" }
  end
end

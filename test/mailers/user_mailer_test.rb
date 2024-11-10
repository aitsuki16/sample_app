require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  test "account_activation" do
    user = users(:michael) # Use a test user fixture (replace 'michael' with your actual fixture)
    user.activation_token = User.new_token # Assign a new activation token
    mail = UserMailer.account_activation(user) # Create the email

    # Test email details
    assert_equal "Account activation", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["igaaida16@gmail.com"], mail.from # Update to your actual 'from' address 
    assert_match user.name, mail.body.encoded
    assert_match user.activation_token, mail.body.encoded
    assert_match CGI.escape(user.email), mail.body.encoded
  end
end

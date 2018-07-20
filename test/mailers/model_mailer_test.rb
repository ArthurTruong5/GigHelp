require 'test_helper'

class ModelMailerTest < ActionMailer::TestCase
  test "new_user_notification" do
    mail = ModelMailer.new_user_notification
    assert_equal "New user notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end

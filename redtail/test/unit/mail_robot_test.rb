require 'test_helper'

class MailRobotTest < ActionMailer::TestCase
  tests MailRobot

  test "create confirmation email" do
    user = User.new(:email => "test@test.com")
    hash = "some-hash"
    url = "some-url/"
    
    @expected.from = "The Hungry Hawk <admin@hungryhawk.org>"
    @expected.to = "test@test.com"
    @expected.subject = "Confirm email address"
    @expected.body = <<EOB
test@test.com,
 
Thank you for registering with our website. To confirm your email address, please visit the following address:

some-url/confirm_email/some-hash

- The Hungry Hawk

EOB

    assert_equal @expected.encoded, MailRobot.create_confirmation_email(user, hash, url).encoded
  end

    test "create reservation email" do
      user = users(:ron)
      reservation = Reservation.create(:user => users(:ron),
                                       :restaurant => restaurants(:italian),
                                       :lunch_period => lunch_periods(:first))

      @expected.from = "The Hungry Hawk <admin@hungryhawk.org>"
      @expected.to = "ron@ron.com"
      @expected.subject = "Hungry Hawk Restaurant Reservation"
      @expected.body = <<EOB
ron@ron.com,

Thank you for your reservation.  We will see you on Sunday March 08, 2009.

- The Hungry Hawk
EOB

      assert_equal @expected.encoded, MailRobot.create_reservation_email(user, reservation).encoded
    end


end

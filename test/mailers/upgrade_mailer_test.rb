# frozen_string_literal: true

require 'test_helper'

module DoraWebUpgrader
  class UpgradeMailerTest < ActionMailer::TestCase
    test 'upgrade started notification' do
      email = UpgradeMailer.upgrade_started('some message', { 'secret': 'my_secret' })
      assert_emails 1 do
        email.deliver_now
      end
      assert_equal ['to@example.com'], email.to
      assert_equal ['from@example.com'], email.from
      assert_equal '[Dummy test] upgrade started', email.subject
    end

    test 'secret is being redacted' do
      email = UpgradeMailer.upgrade_started('some message', { 'secret': 'my_secret' })
      assert_emails 1 do
        email.deliver_now
      end
      assert_no_match 'my_secret', email.body.decoded
    end

    test 'upgrade succeeded notification' do
      email = UpgradeMailer.upgrade_performed('output', 0)
      assert_emails 1 do
        email.deliver_now
      end
      assert_equal ['to@example.com'], email.to
      assert_equal ['from@example.com'], email.from
      assert_equal '[Dummy test] upgrade succeeded', email.subject
    end

    test 'upgrade failed notification' do
      email = UpgradeMailer.upgrade_performed('output', 1)
      assert_emails 1 do
        email.deliver_now
      end
      assert_equal ['to@example.com'], email.to
      assert_equal ['from@example.com'], email.from
      assert_equal '[Dummy test] upgrade failed', email.subject
    end
  end
end

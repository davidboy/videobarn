require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test 'viewing the login form' do
    get :new
    assert_response :success

    # The form fields are tested in the integration tests.  In fact, if they're
    #   broken, *all* of the integration tests will fail.  Thanks a lot, Capybara.
    assert_select 'div.page-header h1', 'Sign in'
  end

  test 'successfully logging in' do
    user = users(:david)
    old_token = user.remember_token

    login_as user.email, '12345'
    user.reload

    # An entirely new remember token will be created for this user...
    assert_not_equal old_token, user.remember_token
    assert_not_nil cookies[:remember_token]

    # ...and the sha1 hash of it will be stored in the db.
    assert_equal user.remember_token, User.encrypt(cookies[:remember_token])

    assert_equal user, assigns[:current_user]

    # After logging in the user will be redirected to the page that they were
    #   trying to access before logging in.  That's tested in a separate
    #   integration test.
    # If the user accessed the login page directly (like what happened in this
    #   test), they'll be redirected to the latest show.
    assert_redirected_to show_path(Show.first)
  end

  test 'logging out' do
    login_as users(:david).email, '12345'

    assert_not_nil assigns[:current_user]
    assert_not_nil cookies[:remember_token]

    delete :destroy

    assert_nil assigns[:current_user]
    assert_nil cookies[:remember_token]
    assert_redirected_to(signin_url)
  end

  private

  def login_as(email, password)
    post :create, session: { email: email, password: password }
  end
end

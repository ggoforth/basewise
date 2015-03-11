require 'test_helper'

class SessionControllerTest < ActionController::TestCase
  context "GET /new" do
    setup do
      #do the request
      get :new
    end

    should "render the 'new' template" do
      assert_template :new
    end

    should "return a 200" do
      assert_response :success
    end
  end

  context "POST /create" do
    setup do
      @pass = 'foobar$23'
      @email = 'greg.goforth@gmail.com'
      @user = Fabricate(:user, email: @email, password: @pass)
    end

    context "and the user is not found" do
      should "render the new template" do
        post :create, user: {email: 'foo@bar.com'}
        assert_template :new
      end
    end

    context "and the user is found" do
      context "but the password is wrong" do
        should "render the new template" do
          post :create, user: {email: @email, password: 'foo'}
          assert_template :new
        end
      end

      context "and the password is correct" do
        setup do
          post :create, user: {email: @email, password: @pass}
        end

        should "log the user in" do
          assert_not_nil assigns(@current_user)
        end

        should "redirect to projects" do
          assert_redirected_to(projects_path)
        end
      end
    end
  end

  context "DELETE /foo" do
    context "when the user is not logged in" do

      should "redirect to signin" do
        delete :foo
        assert_redirected_to(signin_path)
      end
    end

    context "when the user is logged in" do
      setup do
        @pass = 'foobar$23'
        @email = 'greg.goforth@gmail.com'
        @user = Fabricate(:user, email: @email, password: @pass)
        login_user(@user)
      end

      should "remove the session variable" do
        delete :foo
        assert_nil session[:user_id]
      end

      should "set the current user to nil" do
        delete :foo
        assert_nil @controller.current_user
      end

      should "redirect to sign in" do
        delete :foo
        assert_redirected_to signin_path
      end
    end
  end
end

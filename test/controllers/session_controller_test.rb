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
        post :create, {email: 'foo@bar.com'}
        assert_template :new
      end
    end

    context "and the user is found" do
      context "but the password is wrong" do
        should "render the new template" do
          post :create, {email: @email, password: 'foo'}
          assert_template :new
        end
      end

      context "and the password is correct" do
        setup do
          post :create, {email: @email, password: @pass}
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

  context "DELETE /destroy" do
    should "log the user out" do

    end

    should "redirect the user to the login page" do

    end
  end
end

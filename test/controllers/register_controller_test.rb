require 'test_helper'

class RegisterControllerTest < ActionController::TestCase
  context "GET" do
    should "should get new" do
      get :new
      assert_response :success
      assert_not_nil assigns(@user)
    end
  end

  context "CREATE" do
    context "when we have valid user params" do
      setup do
        @valid_params = {
            email: 'greg.goforth@gmail.com',
            first_name: 'Greg',
            last_name: 'Goforth',
            password: 'foobar$32'
        }

        post :create, { user: @valid_params}
      end

      should "we should create one user" do
        assert_equal 1, User.count
      end

      should "the user should be logged in" do
        assert_not_nil assigns(@current_user)
      end

      should "the user is redirected" do
        assert_redirected_to(projects_path)
      end

    end

    context "when we have invalid user params" do
      setup do
        @invalid_params = {
            email: 'greg.goforthgmail.com',
            first_name: 'Greg',
            last_name: '',
            password: 'foo'
        }

        post :create, {user: @invalid_params}
      end

      should "the user is not created" do
        assert_equal 0, User.count
      end

      should "the 'new' template is rendered" do
        assert_template :new
      end
    end
  end
end

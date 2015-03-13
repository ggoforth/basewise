require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = Fabricate(:user)
  end

  context "GET /edit" do
    should "render edit template" do
      login_user(@user)
      get :edit, id: @user.id

      assert_response :success
      assert_template :edit
    end
  end

  context "PUT /user/:id" do
    context "when params are valid" do
      setup do
        @valid_params = {
            id: @user.id,
            user: {
                first_name: "Steve",
                last_name: "miller",
                email: "foo@bar.com",
                password: "foobar$68"
            }
        }
      end

      should "update the user and redirect back to edit with a message" do
        put :update, @valid_params #should update the user model

        @user.reload

        assert_equal "Steve", @user.first_name
        assert_equal "miller", @user.last_name
        assert_equal "foo@bar.com", @user.email
        assert_equal @user, User.authenticate(email: @user.email, password: "foobar$68")
        assert_redirected_to edit_user_path
        assert_equal "Your profile has been updated", flash[:success]
      end
    end

    context "when the params are invalid" do
      setup do
        @invalid_params = {
            id: @user.id, #important as the route will not match if the id is missing
            user: {
                first_name: "G"
            }
        }
      end

      should "render the edit template" do
        put :update, @invalid_params
        assert_template :edit
      end
    end
  end

  context "DELETE /destroy" do
    should "delete a user" do

    end
  end
end

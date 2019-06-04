require 'test_helper'

class SecretsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @secret = secrets(:one)
  end

  test "should get index" do
    get secrets_url, as: :json
    assert_response :success
  end

  test "should create secret" do
    assert_difference('Secret.count') do
      post secrets_url, params: { secret: { content: @secret.content, user_id: @secret.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show secret" do
    get secret_url(@secret), as: :json
    assert_response :success
  end

  test "should update secret" do
    patch secret_url(@secret), params: { secret: { content: @secret.content, user_id: @secret.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy secret" do
    assert_difference('Secret.count', -1) do
      delete secret_url(@secret), as: :json
    end

    assert_response 204
  end
end

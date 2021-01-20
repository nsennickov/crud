# frozen_string_literal: true

require 'test_helper'

class ItemControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    # Fake authentification before test
    get '/users/sign_in'
    sign_in users(:user_001)
    post user_session_url

    @item = Item.new(todo: 'Some title for item', user_id: 1)
  end

  test 'list returns success' do
    get root_path
    assert_response :success
  end

  test 'creates a new item' do
    @bad_item = Item.new

    # Item with acceptable string is saving to db
    assert @item.save
    # Item with blank string isnt saving to db
    assert_not @bad_item.save
  end

  test 'updates item' do
    @item.save

    # Updates item with acceptable string
    assert @item.update(todo: 'Acceptable string')
    # Isnt updates item with blank string
    assert_not @item.update(todo: '')
  end

  test 'destroy item' do
    @item.save

    # Deleted item
    assert @item.destroy
  end

  test 'update returns 404 if item does`t exist' do
    put '/items/undefined_id'
    assert_response :missing
  end

  test 'destroy returns 404 if item does`t exist' do
    delete '/items/undefined_id'
    assert_response :missing
  end
end

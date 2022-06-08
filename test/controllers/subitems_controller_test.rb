# frozen_string_literal: true

require 'test_helper'

class SubitemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    # Fake authentification before test
    get '/users/sign_in'
    sign_in users(:user_001)
    post user_session_url

    @item = Item.create(todo: 'Some todo text', id: 1)
    @subitem = @item.subitems.new(title: 'Some title for item')
  end

  test 'creates a new subitem' do
    @bad_subitem = Subitem.new

    # subitem with acceptable string is saving to db
    assert @subitem.save
    # subitem with blank string isnt saving to db
    assert_not @bad_subitem.save
  end

  test 'updates subitem' do
    @subitem.save

    # Updates subitem with acceptable string
    assert @subitem.update(title: 'Acceptable string')
    # Isnt updates subitem with blank string
    assert_not @subitem.update(title: '')
  end

  test 'destroy item' do
    @subitem.save

    # Deleted subitem
    assert @subitem.destroy
  end

  test 'update returns 404 if item does`t exist' do
    @subitem.save
    put "/items/#{@item.id}/subitems/undefined_id"
    assert_response :missing
  end

  test 'destroy returns 404 if item does`t exist' do
    delete "/items/#{@item.id}/subitems/undefined_id"
    assert_response :missing
  end
end

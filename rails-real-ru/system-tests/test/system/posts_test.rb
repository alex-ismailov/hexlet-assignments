# frozen_string_literal: true

require 'application_system_test_case'

class PostsTest < ApplicationSystemTestCase
  # BEGIN
  setup do
    @post = posts(:one)
  end

  test 'visiting home page' do
    visit root_path
    assert_selector 'h1', text: 'Home#index'
  end

  test 'visiting posts page' do
    visit posts_path
    assert_selector 'h1', text: 'Posts'
  end

  test 'show post' do
    visit post_path(1)
    assert_selector 'h1', text: 'One'
  end

  test 'create a post' do
    visit posts_path

    click_on 'New Post'
    fill_in 'post[title]', with: 'My Post Title'
    fill_in 'post[body]',
            with: 'My post text My post text My post text My post text My post text My post text My post text'
    click_button 'Create Post'

    assert_text 'Post was successfully created.'
  end

  test 'Update a post' do
    visit posts_path

    click_on 'Edit', match: :first
    fill_in 'post[title]', with: 'Updated My Post Title'
    fill_in 'post[body]',
            with: 'Updated Updated Updated My post text My post text My post text My post text My post text My post text My post text'
    click_button 'Update Post'

    assert_text 'Post was successfully updated.'
  end

  test 'Destroy a post' do
    visit posts_path

    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Post was successfully destroyed.'
  end

  # END
end

require 'spec_helper'

RSpec.describe CapybaraLogger do
  it 'has a version number' do
    expect(CapybaraLogger::VERSION).not_to be nil
  end

  describe 'CapybaraLogger with Capybara', type: :feature do
    before { visit '/' }

    it '#visit' do
      expect(page).to have_title 'Test Site'
    end

    it '#find' do
      find('input[name="text"]')
    end
  end
end

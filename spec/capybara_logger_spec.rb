require 'spec_helper'

RSpec.describe CapybaraLogger do
  it 'has a version number' do
    expect(CapybaraLogger::VERSION).not_to be nil
  end

  describe '', type: :feature do
    it '' do
      visit '/'
      expect(page).to have_title 'Test Site'
    end
  end
end

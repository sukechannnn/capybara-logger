require 'spec_helper'

RSpec.describe CapybaraLogger do
  it 'has a version number' do
    expect(CapybaraLogger::VERSION).not_to be nil
  end

  describe 'CapybaraLogger with Capybara', type: :feature do
    using CapybaraLogger

    before do
      @log = []
      allow(CapybaraLogger::LOG).to receive(:info) do |log|
        @log << log
      end

      @session = Capybara::Session.new(:selenium, TestSite)
    end

    context '#visit' do
      it do
        @session.visit '/'
        expect(@log).to contain_exactly('Capybara visit /')
        expect(@session).to have_title 'Test Site'
      end
    end

    context '#find' do
      it do
        @session.visit '/'
        @session.find('input[name="text"]')
        expect(@log).to contain_exactly('Capybara visit /', 'Capybara find input[name="text"]')
      end
    end
  end
end

require 'rails_helper'

describe Couplets::SourcesController do
  describe '#create' do
    it 'creates a new Couplets::Source' do
      expect(Couplets::Source).to receive(:new).with(text: 'here is some text')
      post :create, { couplets_source: { text: 'here is some text' } }
    end
  end
end

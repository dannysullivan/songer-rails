require 'rails_helper'

describe Couplets::SourcesController do
  describe '#create' do
    it 'creates a new Couplets::Source' do
      source = double(:source)
      expect(source).to receive(:create_lines)
      expect(Couplets::Source).to receive(:new).with(text: 'here is some text').and_return(source)
      post :create, params: { couplets_source: { text: 'here is some text' } }
    end
  end
end

require 'rails_helper'

describe LinesController do
  describe '#index' do
    it 'displays all Couplets::RhymeGroups' do
      group = double(:group)
      allow(Couplets::RhymeGroup).to receive(:all).and_return([group])
      get :index
      expect(assigns(:rhyme_groups)).to eq [group]
    end
  end
end

require 'rails_helper'
require 'rake'

describe 'Twitter bot rake tasks' do
  before do
    Rake.application.rake_require "tasks/tweet"
    Rake::Task.define_task(:environment)
  end

  describe 'dog_rhymes' do
    it 'delegates to DogRhymes' do
      allow(DogRhymes).to receive(:tweet)
      Rake.application.invoke_task "tweet:dog_rhymes"
      expect(DogRhymes).to have_received(:tweet)
    end
  end

  describe 'wikihow_rhymes' do
    it 'delegates to WikihowRhymes' do
      allow(WikihowRhymes).to receive(:tweet)
      Rake.application.invoke_task "tweet:wikihow_rhymes"
      expect(WikihowRhymes).to have_received(:tweet)
    end
  end
end

require Rails.root.join('lib', 'dog_rhymes')
require Rails.root.join('lib', 'wikihow_rhymes')

desc "Tweet a dog rhyme"
namespace :tweet do
  task :dog_rhymes => :environment do
    DogRhymes.tweet
  end

  task :wikihow_rhymes => :environment do
    WikihowRhymes.tweet
  end
end

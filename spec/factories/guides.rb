FactoryGirl.define do

  factory :guide do
    title "Something difficult"
    slug "something-difficult"

    body <<-EOF.strip_heredoc
      Mauris, eros urna ac ridiculus duis rhoncus augue mus enim.

      Rhoncus platea tristique ridiculus sagittis, nascetur lacus est.
    EOF

    trait(:published)   { published_at 1.day.ago }
    trait(:unpublished) { published_at 1.day.from_now }

    factory :published_guide,   traits: [ :published ]
    factory :unpublished_guide, traits: [ :unpublished ]
  end

end

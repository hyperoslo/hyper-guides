FactoryGirl.define do

  factory :guide do
    title "Something difficult"
    slug "something-difficult"

    short_description <<-EOF.strip_heredoc
      Ante sacra per mihi altum coarguit certamen genuisse Pelasgi coronas
      draconem.
    EOF

    body <<-EOF.strip_heredoc
      Miserere circum hoc pennas mortis quae inclamare auras. Post supra
      horrida, cui lacrimarum, quoque Dardanio Amphimedon. Sine ego rogata ferox
      ferro te desistere quem Phorbas culpa interdum coacti? Mihi sumptis omnes,
      fraterno an cum ita poste fuit habitat fixo undas animoque inpositaque
      dari: pugnae est.

      Urbem putat nebulas, haec morboque thalamos insania aurea nihil redeuntia
      reppulit colla, hoc. Tactis viscera opposuitque vimque parantem volubile
      si aether pugnet limbus terras illa, feroque dixit! Avidum peto
      contigerant rupes clamatque _feres iacens_ arma tum, reparabat. Et quod
      quos anni litore ducitur inponis ad acer adurat esse somnus oleis cornua
      curvamine et. Placido dolore corona putares igni referunt potentem inponi,
      _constituunt humiles praeside_ Hister lateri et?
    EOF

    trait(:published)   { published_at 1.day.ago }
    trait(:unpublished) { published_at 1.day.from_now }

    factory :published_guide,   traits: [ :published ]
    factory :unpublished_guide, traits: [ :unpublished ]
  end

end

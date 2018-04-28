formats = [ :Hardcover, :Softcover, :Digital ].map {|f| Format.create name: f }

authors = [
  "Autrhur C. Clarke",
  "Isaac Asimov",
  "Robert A. Heinlin",
  "Ayn Rand",
   "Robert Anton Willson"
].map{|a| Author.create name: a }

books = {
  "Autrhur C. Clarke": [
    { title: "Rendezvous With Rama", release: Time.now, price: 10.00, format: formats.sample },
    { title: "Childhood's End", release: Time.now, price: 10.00, format: formats.sample },
    { title: "Songs of a Distant Earth", release: Time.now, price: 10.00, format: formats.sample }
  ],
  "Isaac Asimov": [
    { title: "Foundation", release: Time.now, price: 10.00, format: formats.sample },
    { title: "I, Robot", release: Time.now, price: 10.00, format: formats.sample },
    { title: "The Bicentennial Man", release: Time.now, price: 10.00, format: formats.sample }
  ],
  "Robert A. Heinlin": [
    { title: "Stranger in a Strange Land", release: Time.now, price: 10.00, format: formats.sample },
    { title: "Starship Troopers", release: Time.now, price: 10.00, format: formats.sample },
    { title: "I Will Fear No Evil", release: Time.now, price: 10.00, format: formats.sample }
  ],
  "Ayn Rand": [
    { title: "The Fountainhead", release: Time.now, price: 10.00, format: formats.sample },
    { title: "Atlas Shrugged", release: Time.now, price: 10.00, format: formats.sample },
    { title: "The Romantic Manifesto", release: Time.now, price: 10.00, format: formats.sample }
  ],
  "Robert Anton Willson": [
    { title: "The Eye in the Pyramid", release: Time.now, price: 10.00, format: formats.sample },
    { title: "Everything is Under Control", release: Time.now, price: 10.00, format: formats.sample },
    { title: "Masks of the Illuminati", release: Time.now, price: 10.00, format: formats.sample }
  ]
}

authors.flat_map { |a|
  books[a.name.to_sym].reduce([]) { |m,v|
    a.books.create! title: v[:title], release: v[:release], price: v[:price], format: v[:format]
  }
}

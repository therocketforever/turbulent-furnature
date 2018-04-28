require 'rails_helper'

RSpec.describe Authorship, type: :model do
  let :format { FactoryBot.create :format, name: :Hardcover }
  let :author { FactoryBot.create :author, name: :"Ursula K Leguiin" }

  let :book { author.books.create! title: "Tales From Earthsea", release: Time.now, price: 10.00, format: format }

  let :authorship { book.authorships.first }

  it {
    expect( authorship ).to respond_to( :book )
    expect( authorship ).to respond_to( :author )
  }
end

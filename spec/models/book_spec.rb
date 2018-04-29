require 'rails_helper'

RSpec.describe Book, type: :model do
  let :format { Format.all === 0 ? FactoryBot.create( :format ) : Format.all.sample }
  let :author { FactoryBot.create :author, name: :"Thomas Pynchon" }

  let :book { author.books.create! title: "Gravity's Rainbow", release: Time.now, price: 10.00, format: format }

  it {
    expect( book ).to respond_to( :title )
    expect( book ).to respond_to( :release )
    expect( book ).to respond_to( :price )
  }

  it {
    expect( book ).to respond_to( :format )
    expect( book ).to respond_to( :authorships )
    expect( book ).to respond_to( :authors )
  }

  it {
    expect( book.format ).to be format
    expect( book.authors.first ).to eq author
  }

end

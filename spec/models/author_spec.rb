require 'rails_helper'

RSpec.describe Author, type: :model do
  let :format { Format.all === 0 ? FactoryBot.create( :format ) : Format.all.sample }
  let :author { FactoryBot.create :author, name: :"Thomas Pynchon" }

  it {
   expect( author ).to respond_to( :name )
  }

  it {
    expect( author ).to respond_to( :authorships )
    expect( author).to respond_to( :books )
  }

end

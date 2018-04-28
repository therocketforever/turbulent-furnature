require 'rails_helper'

RSpec.describe Author, type: :model do
  let :format { FactoryBot.create :format, name: :Hardcover }
  let :author { FactoryBot.create :author, name: :"Thomas Pynchon" }

  it {
   expect( author ).to respond_to( :name )
  }

  it {
    expect( author ).to respond_to( :authorships )
    expect( author).to respond_to( :books )
  }

end

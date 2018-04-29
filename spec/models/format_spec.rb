require 'rails_helper'

RSpec.describe Format, type: :model do
  let :hardcover { FactoryBot.create :format, :hardcover }
  let :softcover { FactoryBot.create :format, :softcover }
  let :digital { FactoryBot.create :format, :digital }

  let :format { [ hardcover, softcover, digital ].sample }

  it {
    expect( format ).to respond_to( :name )
  }

  it {
    expect( format ).to respond_to( :books )
  }

end

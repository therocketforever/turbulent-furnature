require 'rails_helper'

RSpec.describe Format, type: :model do
  let :hardcover { FactoryBot.create :format, name: :Hardcover }
  let :softcover { FactoryBot.create :format, name: :Softcover }
  let :digital { FactoryBot.create :format, name: :Digital }

  let :format { [ hardcover, softcover, digital ].sample }

  it {
    expect( format ).to respond_to( :name )
  }

  it {
    expect( format ).to respond_to( :books )
  }

end

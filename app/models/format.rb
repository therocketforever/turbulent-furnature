class Format < ApplicationRecord
  unless Format.count === 0 || Rails.env == "test"
    Hardcover = Format.find_by( name: :Hardcover ).id.freeze
    Softcover = Format.find_by( name: :Softcover ).id.freeze
    Digital = Format.find_by( name: :Digital ).id.freeze
  end

  has_many :books

end


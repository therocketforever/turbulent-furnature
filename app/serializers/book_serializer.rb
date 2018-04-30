class BookSerializer < BaseSerializer
  attributes :title, :release, :price
  has_many :authors

  attribute :format do
    @_format ||= case object.format.name
    when 1
      :softcover
    when 2
      :digital
    else
     :hardcover
    end
  end
end

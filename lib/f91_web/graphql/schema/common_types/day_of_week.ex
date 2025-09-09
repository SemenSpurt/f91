defmodule F91Web.GraphQL.Schema.DayOfWeek do
  use Absinthe.Schema.Notation


  enum :day_of_week, values: [
    :monday,
    :tuesday,
    :wednesday,
    :thursday,
    :friday,
    :saturday,
    :sunday,
    :holiday,
    :pre_holiday
  ]
end

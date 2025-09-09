defmodule F91Web.GraphQL.Schema.Order do
  use Absinthe.Schema.Notation
  enum :order_type,
    values: [:id, :created_at, :updated_at]

  enum :order_dir,
    values: [:desc, :asc]

  input_object :order_input do
    field :type, :order_type
    field :dir, :order_dir
  end

  enum :order_direction,
    values: [
      :asc,
      :desc,
      :asc_nulls_first,
      :asc_nulls_last,
      :desc_nulls_first,
      :desc_nulls_last
    ]
end

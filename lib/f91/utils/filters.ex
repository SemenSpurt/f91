defmodule F91.Utils.Filters do
  import Ecto.Query

  def compare_filter(nil, _fld, _cmp, _value), do: nil

  def compare_filter(q, fld, cmp, value) when is_nil(fld) or is_nil(cmp) or is_nil(value), do: q

  def compare_filter(q, fld, :>, value), do: where(q, [q], field(q, ^fld) > ^value)

  def compare_filter(q, fld, :<, value), do: where(q, [q], field(q, ^fld) < ^value)

  def compare_filter(q, fld, :=, value), do: where(q, [q], field(q, ^fld) == ^value)

  def compare_filter(q, fld, :!=, value), do: where(q, [q], field(q, ^fld) != ^value)

  def compare_filter(q, fld, :>=, value), do: where(q, [q], field(q, ^fld) >= ^value)

  def compare_filter(q, fld, :<=, value), do: where(q, [q], field(q, ^fld) <= ^value)

  def order(nil, _fields, _field, _dir), do: nil
  def order(q, nil, _field, _dir), do: q
  def order(q, _fields, nil, _dir), do: q

  def order(q, fields, field, dir) do
    if :"#{field}" in fields do
      field = :"#{field}"

      order_by(q, [{^dir, ^field}])
    else
      q
    end
  end

  def search(nil, _fields, _search_string), do: nil

  def search(q, _fields, ""), do: q

  def search(q, fields, search_string) when is_nil(fields) or is_nil(search_string), do: q

  def search(querable, fields, search_string) do
    fields
    |> Enum.reduce(nil, fn fld, acc ->
      if acc do
        or_where(acc, [q], ilike(field(q, ^fld), ^"%#{search_string}%"))
      else
        where(querable, [q], ilike(field(q, ^fld), ^"%#{search_string}%"))
      end
    end)
  end

  def filter(nil, _opts), do: nil

  def filter(queryable, nil), do: queryable

  def filter(queryable, opts) when is_list(opts) do
    list = Keyword.get(opts, :list, [])
    single = Keyword.get(opts, :single, [])
    string = Keyword.get(opts, :string, [])

    limit = Keyword.get(opts, :limit, nil)
    offset = Keyword.get(opts, :offset, nil)

    queryable
    |> apply_filters(:list, list)
    |> apply_filters(:single, single)
    |> apply_filters(:string, string)
    |> limit_filter(limit)
    |> offset_filter(offset)
  end

  defp apply_filters(queryable, type, opts) do
    func = select_filter_function(type)

    opts
    |> Enum.reduce(queryable, fn {key, values}, queryable ->
      func.(queryable, key, values)
    end)
  end

  defp select_filter_function(type) do
    case type do
      :list ->
        &list_filter/3

      :single ->
        &single_filter/3

      :string ->
        &string_filter/3
    end
  end

  def list_filter(nil, _field, _values), do: nil

  def list_filter(queryable, nil, _values), do: queryable

  def list_filter(queryable, _field, nil), do: queryable

  def list_filter(queryable, fld, values) when is_list(values),
    do: where(queryable, [q], field(q, ^fld) in ^values)

  def between_filter(nil, _field, _v1, _v2), do: nil

  def between_filter(queryable, nil, _v1, _v2), do: queryable

  def between_filter(q, field, v1, nil),
    do: compare_filter(q, field, :>=, v1)

  def between_filter(q, field, nil, v2),
    do: compare_filter(q, field, :<=, v2)

  def between_filter(q, key, v1, v2),
    do: from(o in q, where: fragment("? BETWEEN ? AND ?", field(o, ^key), ^v1, ^v2))

  def single_filter(nil, _field, _value), do: nil

  def single_filter(queryable, nil, _value), do: queryable

  def single_filter(queryable, _field, nil), do: queryable

  def single_filter(queryable, fld, value),
    do: where(queryable, [q], field(q, ^fld) == ^value)

  def string_filter(nil, _field, _value), do: nil

  def string_filter(queryable, nil, _value), do: queryable

  def string_filter(queryable, _field, nil), do: queryable

  def string_filter(queryable, fld, value) when is_binary(value),
    do: where(queryable, [q], ilike(field(q, ^fld), ^"%#{value}%"))

  def limit_filter(nil, _value), do: nil

  def limit_filter(queryable, nil), do: queryable

  def limit_filter(queryable, value) when is_integer(value),
    do: limit(queryable, ^value)

  def offset_filter(nil, _value), do: nil

  def offset_filter(queryable, nil), do: queryable

  def offset_filter(queryable, value) when is_integer(value),
    do: offset(queryable, ^value)

  def numeric_filter(nil, _field, _cmp, _value), do: nil

  def numeric_filter(queryable, nil, _cmp, _value), do: queryable

  def numeric_filter(queryable, _fld, nil, _value), do: queryable

  def numeric_filter(queryable, _field, _cmp, nil), do: queryable

  def numeric_filter(queryable, fld, :>, value),
    do: where(queryable, [q], field(q, ^fld) > ^value)

  def numeric_filter(queryable, fld, :<, value),
    do: where(queryable, [q], field(q, ^fld) < ^value)

  def numeric_filter(queryable, fld, :=, value),
    do: where(queryable, [q], field(q, ^fld) == ^value)

  def numeric_filter(queryable, fld, :>=, value),
    do: where(queryable, [q], field(q, ^fld) >= ^value)

  def numeric_filter(queryable, fld, :<=, value),
    do: where(queryable, [q], field(q, ^fld) <= ^value)
end

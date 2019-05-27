defmodule Roman do
  @mapping [
    {5, "V"},
    {4, "IV"},
    {1, "I"},
  ]

  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t()
  def numerals(number) do
    {0, final_roman_string} = Enum.reduce(@mapping, {number, ""}, fn({arabic, roman}, {number, str}) ->
      { rem(number, arabic), str <> String.duplicate(roman, div(number, arabic)) }
    end)

    final_roman_string
  end
end

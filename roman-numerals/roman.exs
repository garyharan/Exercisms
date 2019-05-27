defmodule Roman do
  @mapping [
    {1000, "M"},
    {900,  "CM"},
    {500,  "D"},
    {400,  "CD"},
    {100,  "C"},
    {90,   "XC"},
    {50,   "L"},
    {40,   "XL"},
    {10,   "X"},
    {9,    "IX"},
    {5,    "V"},
    {4,    "IV"},
    {1,    "I"},
  ]

  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t()
  def numerals(number) do
    romanize(number, "", @mapping)
  end

  def romanize(number, roman_number, [{arabic_value, roman_value} | _tail] = mapping) when number >= arabic_value do
    romanize(number - arabic_value, roman_number <> roman_value, mapping)
  end

  def romanize(number, roman_number, [_head | tail]) do
    romanize(number, roman_number, tail)
  end

  def romanize(_number, roman_number, []) do
    roman_number
  end
end

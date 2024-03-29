defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> to_charlist
    |> Enum.map(fn code -> rotate_char(code, shift) end)
    |> to_string
  end

  def rotate_char(code, 0), do: code

  def rotate_char(code, shift) when code in ?A..?Z do
    rem(code + shift - ?A, 26) + ?A
  end

  def rotate_char(code, shift) when code in ?a..?z do
    rem(code + shift - ?a, 26) + ?a
  end

  def rotate_char(code, _shift), do: code
end

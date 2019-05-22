defmodule SecretHandshake do
  use Bitwise

  defmacro is_reversible(code) do
    quote do: Bitwise.band(0b10000, unquote(code)) != 0
  end

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) when is_reversible(code) do
    commands(code - 0b10000)
    |> Enum.reverse
  end

  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    actions = [
      {"wink"            , 0b00001},
      {"double blink"    , 0b00010},
      {"close your eyes" , 0b00100},
      {"jump"            , 0b01000}
    ]

    Enum.filter(actions, fn {_k, v} ->
      (code &&& v) != 0
    end)
    |> Enum.reduce([], fn ({k, _v}, acc) ->
      acc ++ [k]
    end)
  end
end

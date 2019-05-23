defmodule Reversible do
  defguard is_reversible(code) do
    quote do: Bitwise.band(0b10000, unquote(code)) != 0
  end
end

defmodule SecretHandshake do
  use Bitwise, only: &&&

  @actions %{
    1 => "wink",
    2 => "double blink",
    4 => "close your eyes",
    8 => "jump"
  }

  def commands(code) when is_reversible(code) do
    commands(code - 0b10000)
    |> Enum.reverse
  end

  def commands(code) do
    for {key, val} <- @actions , (code &&& key) > 0, do: val
  end
end

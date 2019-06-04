defmodule Bob do
  def hey(input) do
    cond do
      passive_aggresive?(input)               -> "Fine. Be that way!"
      all_caps?(input) and question?(input)   -> "Calm down, I know what I'm doing!"
      question?(input)                        -> "Sure."
      question?(input)                        -> "Sure."
      all_caps?(input) || russian?(input)     -> "Whoa, chill out!"
      true                                    -> "Whatever."
    end
  end

  defp all_caps?(input),          do: String.upcase(input) == input && String.downcase(input) != input
  defp question?(input),          do: String.at(input, -1) == "?"
  defp passive_aggresive?(input), do: String.trim(input) == ""
  defp russian?(input),           do: to_charlist(input) |> Enum.any?(fn c -> c > 122 end)
end

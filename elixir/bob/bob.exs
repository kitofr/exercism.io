defmodule Domain do
  def rules do
    [{ &shout?/1    , "Whoa, chill out!" },
     { &question?/1 , "Sure."},
     { &silence?/1  , "Fine. Be that way!"}, 
     { &default/1   , "Whatever."}]
  end

  defp shout?(p) do 
    p == String.upcase(p) && 
    p != String.downcase(p)
  end
  defp question?(p), do:  p |> String.ends_with? "?"
  defp silence?(p), do: p |> String.strip |> String.length == 0
  defp default(_), do: true 
end

defmodule Teenager do
  def hey(input) do
    Enum.reduce(Domain.rules, fn({f, v}, _) -> if f.(input), do: v end)
  end
end

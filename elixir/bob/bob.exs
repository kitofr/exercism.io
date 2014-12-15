defmodule Remark do
  def rules do
    [{ &shout?/1    , "Whoa, chill out!" },
     { &question?/1 , "Sure."},
     { &silence?/1  , "Fine. Be that way!"}, 
     { &default/1   , "Whatever."}]
  end

  defp shout?(phrase) do 
    phrase == String.upcase(phrase) && 
    phrase != String.downcase(phrase)
  end
  defp question?(phrase), do:  phrase |> String.ends_with? "?"
  defp silence?(phrase), do: phrase |> String.strip |> String.length == 0
  defp default(_), do: true 
end

defmodule Teenager do
  defp answer(input, [{f,v}|t]) do
    if f.(input), do: v, else: answer(input, t)
  end

  def hey(input) do
    input |> answer(Remark.rules)
  end
end

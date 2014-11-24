defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map() 
  def count(sentence) do
    String.downcase(sentence)
    |> ignore_underscores 
    |> ignore_punctuation 
    |> String.split
    |> frequencies
  end

  defp val {:ok, v }  do v end
  defp val :error  do 0 end

  defp ignore_punctuation(sentence) do
    Regex.replace ~r/[^a-z0-9\-\s]/, sentence, ""
  end

  defp ignore_underscores(sentence) do
    Regex.replace ~r/_|\,/, sentence, " "
  end

  defp frequencies(seq) do
    Enum.reduce(seq, %{}, 
    fn(x, acc) ->
      Dict.put(acc, x, Dict.fetch(acc ,x) |> val |> + 1)
    end)
  end

end

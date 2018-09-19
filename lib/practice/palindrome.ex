defmodule Practice.Palindrome do

  def palindrome?(s) do
    len = String.length(s)
    cond do
      (len <= 1) ->
        true
      true ->
        first_char = String.slice(s, 0..0)
        last_char = String.slice(s, (len - 1)..(len- 1))
        rest = String.slice(s, 1..(len - 2))
        first_char == last_char && palindrome?(rest)
    end
  end
end

defmodule Practice.Factor do

  def factor(x) do
    factors([], x, 2)
  end

  def factors(acc, x, n) do
    cond do
      (n >= x) ->
        acc ++ [x]
      (rem(x, n) == 0) ->
        factors(acc ++ [n], div(x, n), 2)
      true ->
        factors(acc, x, n + 1)
    end
  end
end

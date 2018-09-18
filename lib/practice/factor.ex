defmodule Practice.factor do

  # TODO actually factor this
  def factor(x) do
    factors([], x, 2)
  end

  def factors(acc, x, n) do
    cond do
      (n >= x) ->
        acc ++ [x]
      (rem(x, n) == 0) ->
        factors(acc ++ [n], x / n, 3)
      true
        factors(acc, x, n + 1)
    end
  end
end

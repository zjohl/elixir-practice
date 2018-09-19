defmodule Practice.Calc do
  def parse_float(text) do
    {num, _} = Float.parse(text)
    num
  end

  def tag_token(el) do
    cond do
      (Enum.member?(["+", "-", "*", "/"], el)) ->
        {:op, el}
      true ->
        {:num, parse_float(el)}
    end
  end

  def convert_postfix(l) do
    convert_postfix(l, [], [])
  end

  def higher_prec(op1, op2) do
    case {op1, op2} do
      {"*", any} ->
        true
      {"/", "+"} ->
        true
      {"/", "-"} ->
        true
      _ ->
        false
    end
  end

  def convert_postfix(l, acc, stack) do
    if (length(l) > 0) do
      case hd(l) do
        nil ->
          acc ++ stack
        {:num, n} ->
          convert_postfix(tl(l), acc ++ [{:num, n}], stack)
        {:op, op} ->
          cond do
            (length(stack) == 0) ->
              convert_postfix(tl(l), acc, [{:op, op}])
            (higher_prec(op, elem(hd(stack), 1))) ->
              convert_postfix(tl(l), acc ++ stack, [{:op, op}])
            true ->
              convert_postfix(tl(l), acc, [{:op, op}] ++ stack)
          end
      end
    else
      acc ++ stack
    end
  end

  def eval(l) do
    tail = tl(l)
    case hd(l) do
      {:num, n} ->
        n
      {:op, "+"} ->
       eval(tl(tail)) + eval([hd(tail)])
      {:op, "-"} ->
        eval(tl(tail)) - eval([hd(tail)])
      {:op, "*"} ->
        eval(tl(tail)) * eval([hd(tail)])
      {:op, "/"} ->
        eval(tl(tail)) / eval([hd(tail)])
    end
  end

  def calc(expr) do
    expr
    |> String.split(~r/\s+/)
    |> Enum.map(&Practice.Calc.tag_token/1)
    |> Practice.Calc.convert_postfix
    |> Enum.reverse
    |> Practice.Calc.eval()
  end
end

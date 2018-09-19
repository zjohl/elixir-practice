defmodule PracticeWeb.PageController do
  use PracticeWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def double(conn, %{"x" => x}) do
    {x, _} = Integer.parse(x)
    y = Practice.double(x)
    render conn, "double.html", x: x, y: y
  end

  def calc(conn, %{"expr" => expr}) do
    y = Practice.calc(expr)
    render conn, "calc.html", expr: expr, y: y
  end

  def factor(conn, %{"x" => x}) do
    y = Practice.factor(String.to_integer(x))
    render conn, "factor.html", x: x, y: y
  end

  def palindrome(conn, %{"s" => s}) do
    pal = Practice.palindrome?(s)
    render conn, "palindrome.html", pal: pal
  end
end

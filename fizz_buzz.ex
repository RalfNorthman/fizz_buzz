defmodule FizzBuzz do

  def case_fizzbuzz(n) do
    func = fn i -> 
      case [rem(i, 3), rem(i, 5), i] do
        [0, 0, _] -> "FizzBuzz"
        [0, _, _] -> "Fizz"
        [_, 0, _] -> "Buzz"
        [_, _, i] -> i
      end
    end
    import Enum
    1..n |> map(func) |> each(&IO.puts/1) 
  end

  def stream_fizzbuzz(n) do
    import Stream
    nums   = iterate 1, &(&1 + 1)
    fizzes = cycle ["", "", "Fizz"]
    buzzes = cycle ["", "", "", "", "Buzz"]
    func   = fn { {"", ""}, number } -> number
                { {fi, bu}, _num } -> fi <> bu 
    end
    zip(fizzes, buzzes) 
    |> zip(nums)
    |> map(func)
    |> take(n)
    |> Enum.each(&IO.puts/1)
  end

end

defmodule Rocketpay.Numbers do
  def sum_from_file(filename) do
    # Pipe Operator
    "#{filename}.csv"
    |> File.read()
    |> handle_file()
  end

  # Pattern Matching
  defp handle_file({:ok, result}) do
    result
    |> String.split(",")
    |> Enum.map(fn number -> String.to_integer(number) end)
    |> Enum.sum()

    # or
    # result = String.split(result, ",")
    # result = Enum.map(result, fn number -> String.to_integer(number) end)
    # result = Enum.sum(result)
    # result ## in Elixir, the last line is already the return
  end
  defp handle_file({:error, _reason}), do: {:error, "Invalid file!"}
end

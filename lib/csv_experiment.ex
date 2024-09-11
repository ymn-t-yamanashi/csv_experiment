NimbleCSV.define(Csv, [])

defmodule CsvExperiment do
  @moduledoc """
  Documentation for `CsvExperiment`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> CsvExperiment.hello()
      :world

  """

  @range 1..9
  @csv_file_name "multiplication.csv"
  def hello do
    list = creat_multiplication_list()
    IO.puts("------------ 掛け算リスト ------------")
    IO.inspect(list)

    IO.puts("------------ 掛け算CSV作成 ------------")

    list
    |> wite_csv!(@csv_file_name)

    File.read!(@csv_file_name)
    |> IO.inspect()

    IO.puts("------------ 掛け算CSVロード ------------")

    read_csv!(@csv_file_name)
    |> IO.inspect()

    :world
  end

  def wite_csv!(data, path) do
    data
    |> Csv.dump_to_iodata()
    |> IO.iodata_to_binary()
    |> then(&File.write!(path, &1))
  end

  def read_csv!(path), do: File.read!(path) |> Csv.parse_string()

  def creat_multiplication_list() do
    for x <- @range do
      for y <- @range, do: x * y
    end
  end
end

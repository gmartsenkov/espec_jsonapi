defmodule EspecJsonapi.Assertions.WithData do
  use ESpec.Assertions.Interface

  def match(subject, { { matcher, args }, expected }) do
    { result, data } = matcher.match(subject, args)
    {
      result && data == expected,
      { result, data }
    }
  end

  def success_message(subject, { { matcher, args}, _arg }, { _result, data }, positive) do
    to = if positive, do: "has", else: "does not have"
    "`#{inspect subject}` #{to} #{matcher_type(matcher)} #{args} with data #{data}."
  end

  def error_message(subject, {{matcher, arg}, expected}, {true, data}, positive) do
    to = if positive, do: "to", else: "not to"
    "Expected `#{inspect subject}` #{to} have #{matcher_type(matcher)} #{arg} with data #{expected} but is #{data}."
  end

  def error_message(subject, {{matcher, arg}, _expected}, {false, data}, positive) do
    matcher.error_message(subject, arg, data, positive)
  end

  def matcher_type(matcher) do
    Regex.run(~r/Have(.*)/, "#{matcher}")
    |> List.last
    |> String.downcase
  end
end

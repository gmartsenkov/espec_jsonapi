defmodule EspecJsonapi.Assertions.WithData do
  def match(subject, { { matcher, args }, expected }) do
    { result, data } = matcher.match(subject, args)
    {
      result && data == expected,
      { result, data }
    }
  end

  def success_message(subject, { _matcher, arg }, { _result, data }, positive) do
    to = if positive, do: "has", else: "does not have"
    "`#{inspect subject}` #{to} attribute #{arg} with data #{data}."
  end

  def error_message(subject, {{_matcher, arg}, expected}, {true, data}, positive) do
    to = if positive, do: "to", else: "not to"
    "Expected `#{inspect subject}` #{to} have attribute #{arg} with data #{expected} but is #{data}."
  end

  def error_message(subject, {{matcher, arg}, _expected}, {false, data}, positive) do
    matcher.error_message(subject, arg, data, positive)
  end
end
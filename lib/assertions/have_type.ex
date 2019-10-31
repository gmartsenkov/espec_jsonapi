defmodule EspecJsonapi.Assertions.HaveType do
  use ESpec.Assertions.Interface

  def match(subject, type) do
    {
      is_map(subject) && subject["type"] == type,
      subject
    }
  end

  def success_message(subject, type, _result, positive) do
    to = if positive, do: "has", else: "does not have"
    "`#{inspect subject}` #{to} a type of #{type}."
  end

  def error_message(subject, type, _result, positive) do
    to = if positive, do: "to", else: "not to"
    "Expected `#{inspect subject}` #{to} have a type of #{type}."
  end
end

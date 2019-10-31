defmodule EspecJsonapi.Assertions.HaveId do
  use ESpec.Assertions.Interface

  def match(subject, id) do
    {
      is_map(subject) && subject["id"] == id,
      subject
    }
  end

  def success_message(subject, id, _result, positive) do
    to = if positive, do: "has", else: "does not have"
    "`#{inspect subject}` #{to} an id of #{id}."
  end

  def error_message(subject, id, _result, positive) do
    to = if positive, do: "to", else: "not to"
    "Expected `#{inspect subject}` #{to} have an id of #{id}."
  end
end

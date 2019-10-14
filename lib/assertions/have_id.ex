defmodule EspecJsonapi.Assertions.HaveId do
  @compile if Mix.env == :test, do: :export_all

  use ESpec.Assertions.Interface

  defp match(subject, id) do
    {
      is_map(subject) && subject["data"]["id"] == id,
      subject
    }
  end

  defp success_message(subject, id, _result, positive) do
    to = if positive, do: "has", else: "does not have"
    "`#{inspect subject}` #{to} an id of #{id}."
  end

  defp error_message(subject, id, _result, positive) do
    to = if positive, do: "to", else: "not to"
    "Expected `#{inspect subject}` #{to} have an id of #{id}."
  end
end

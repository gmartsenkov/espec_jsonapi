defmodule EspecJsonapi.Assertions.HaveType do
  @compile if Mix.env == :test, do: :export_all

  use ESpec.Assertions.Interface

  defp match(subject, type) do
    {
      is_map(subject) && subject["type"] == type,
      subject
    }
  end

  defp success_message(subject, type, _result, positive) do
    to = if positive, do: "has", else: "does not have"
    "`#{inspect subject}` #{to} a type of #{type}."
  end

  defp error_message(subject, type, _result, positive) do
    to = if positive, do: "to", else: "not to"
    "Expected `#{inspect subject}` #{to} have a type of #{type}."
  end
end

defmodule EspecJsonapi.Assertions.HaveAttribute do
  @compile if Mix.env == :test, do: :export_all

  use ESpec.Assertions.Interface

  defp match(%{ "attributes" => attributes } = subject, attribute) do
    keys = Map.keys(attributes)
    {
      Enum.member?(keys, attribute),
      subject
    }
  end

  defp match(subject, _attribute), do: { false, subject }

  defp success_message(subject, attribute, _result, positive) do
    to = if positive, do: "has", else: "does not have"
    "`#{inspect subject}` #{to} attribute #{attribute}."
  end

  defp error_message(subject, attribute, _result, positive) do
    to = if positive, do: "to", else: "not to"
    "Expected `#{inspect subject}` #{to} have attribute #{attribute}."
  end
end

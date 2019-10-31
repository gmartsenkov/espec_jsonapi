defmodule EspecJsonapi.Assertions.HaveAttribute do
  use ESpec.Assertions.Interface

  def match(%{ "attributes" => attributes } = subject, attribute) do
    keys = Map.keys(attributes)
    {
      Enum.member?(keys, attribute),
      attributes[attribute]
    }
  end

  def match(subject, _attribute), do: { false, subject }

  def success_message(subject, attribute, _result, positive) do
    to = if positive, do: "has", else: "does not have"
    "`#{inspect subject}` #{to} attribute #{attribute}."
  end

  def error_message(subject, attribute, _result, positive) do
    to = if positive, do: "to", else: "not to"
    "Expected `#{inspect subject}` #{to} have attribute #{attribute}."
  end
end

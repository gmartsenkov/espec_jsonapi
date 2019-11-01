defmodule EspecJsonapi.Assertions.HaveRelationship do
  use ESpec.Assertions.Interface

  def match(%{ "relationships" => relationships } = _subject, relationship) do
    keys = Map.keys(relationships)
    {
      Enum.member?(keys, relationship),
      relationships[relationship]
    }
  end

  def match(subject, _relationship), do: { false, subject }

  def success_message(subject, relationship, _result, positive) do
    to = if positive, do: "has", else: "does not have"
    "`#{inspect subject}` #{to} relationship #{relationship}."
  end

  def error_message(subject, relationship, _result, positive) do
    to = if positive, do: "to", else: "not to"
    "Expected `#{inspect subject}` #{to} have relationship #{relationship}."
  end
end

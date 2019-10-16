defmodule EspecJsonapi.Assertions.HaveAttributes do
  @compile if Mix.env == :test, do: :export_all

  use ESpec.Assertions.Interface

  defp match(%{ "attributes" => attributes }, expected_attributes) do
    keys = Map.keys(attributes)
    missing_keys = match_keys(keys, expected_attributes)
    {
      Enum.empty?(missing_keys),
      missing_keys
    }
  end

  defp match(subject, _attribute), do: { false, subject }

  defp success_message(subject, attributes, _result, positive) do
    to = if positive, do: "has", else: "does not have"
    "`#{inspect subject}` #{to} attributes #{attributes}."
  end

  defp error_message(subject, _attributes, result, positive) do
    to = if positive, do: "to", else: "not to"
    "Expected `#{inspect subject}` #{to} have attributes #{inspect result}."
  end

  defp match_keys(keys, expected_keys, missing_keys \\ [])
  defp match_keys(keys, [head|tail] = _expected_keys, missing_keys) do
    if Enum.member?(keys, head) do
      match_keys(keys, tail, missing_keys)
    else
      match_keys(keys, tail, missing_keys ++ [head])
    end
  end

  defp match_keys(_keys, [], missing_keys), do: missing_keys
end

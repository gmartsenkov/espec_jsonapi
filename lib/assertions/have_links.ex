defmodule EspecJsonapi.Assertions.HaveLinks do
  use ESpec.Assertions.Interface

  def match(%{ "links" => links }, expected_links) do
    keys = Map.keys(links)
    missing_keys = match_keys(keys, expected_links)
    {
      Enum.empty?(missing_keys),
      missing_keys
    }
  end

  def match(subject, _attribute), do: { false, subject }

  def success_message(subject, links, _result, positive) do
    to = if positive, do: "has", else: "does not have"
    "`#{inspect subject}` #{to} links #{links}."
  end

  def error_message(subject, _links, result, positive) do
    to = if positive, do: "to", else: "not to"
    "Expected `#{inspect subject}` #{to} have links #{inspect result}."
  end

  def match_keys(keys, expected_keys, missing_keys \\ [])
  def match_keys(keys, [head|tail] = _expected_keys, missing_keys) do
    if Enum.member?(keys, head) do
      match_keys(keys, tail, missing_keys)
    else
      match_keys(keys, tail, missing_keys ++ [head])
    end
  end

  def match_keys(_keys, [], missing_keys), do: missing_keys
end

defmodule EspecJsonapi.Assertions.HaveLink do
  use ESpec.Assertions.Interface

  def match(%{ "links" => links } = _subject, link) do
    keys = Map.keys(links)
    {
      Enum.member?(keys, link),
      links[link]
    }
  end

  def match(subject, _link), do: { false, subject }

  def success_message(subject, link, _result, positive) do
    to = if positive, do: "has", else: "does not have"
    "`#{inspect subject}` #{to} link #{link}."
  end

  def error_message(subject, link, _result, positive) do
    to = if positive, do: "to", else: "not to"
    "Expected `#{inspect subject}` #{to} have link #{link}."
  end
end

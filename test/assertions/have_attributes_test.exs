defmodule EspecJsonapi.Assertions.HaveAttributesTest do
  use ExUnit.Case
  alias EspecJsonapi.Assertions.HaveAttributes

  test "match when subject is an empty map" do
    assert HaveAttributes.match(%{}, "user") == {false, %{}}
  end

  test "match when subject is another type" do
    assert HaveAttributes.match("invalid", "user") == {false, "invalid"}
  end

  test "match when the subject attributes matches" do
    subject = %{ "attributes" => %{ "name" => "John", "age" => 17 } }
    assert HaveAttributes.match(subject, ["name", "age"]) == {true, []}
  end

  test "match not all attributes match" do
    subject = %{ "attributes" => %{ "name" => "John", "age" => 17 } }
    assert HaveAttributes.match(subject, ["name", "age", "pet", "city"]) == {false, ["pet", "city"]}
  end

  test "success_message when positive is true" do
    subject = %{ "attributes" => %{ "name" => "John" } }
    expected = "`%{\"attributes\" => %{\"name\" => \"John\"}}` has attributes name."
    assert HaveAttributes.success_message(subject, ["name"], nil, true) == expected
  end

  test "success_message when positive is false" do
    subject = %{ "attributes" => %{ "name" => "John" } }
    expected = "`%{\"attributes\" => %{\"name\" => \"John\"}}` does not have attributes age."
    assert HaveAttributes.success_message(subject, ["age"], nil, false) == expected
  end

  test "error_message when positive is true" do
    subject = %{ "attributes" => %{ "name" => "John" } }
    expected = "Expected `%{\"attributes\" => %{\"name\" => \"John\"}}` to have attributes [\"age\"]."
    assert HaveAttributes.error_message(subject, nil, ["age"], true) == expected
  end

  test "error_message when positive is false" do
    subject = %{ "attributes" => %{ "name" => "John" } }
    expected = "Expected `%{\"attributes\" => %{\"name\" => \"John\"}}` not to have attributes [\"name\", \"age\"]."
    assert HaveAttributes.error_message(subject, nil, ["name", "age"], false) == expected
  end
end

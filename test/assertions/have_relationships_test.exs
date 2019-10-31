defmodule EspecJsonapi.Assertions.HaveRelationshipsTest do
  use ExUnit.Case
  alias EspecJsonapi.Assertions.HaveRelationships

  test "match when subject is an empty map" do
    assert HaveRelationships.match(%{}, "user") == {false, %{}}
  end

  test "match when subject is another type" do
    assert HaveRelationships.match("invalid", "user") == {false, "invalid"}
  end

  test "match when the subject relationships matches" do
    subject = %{ "relationships" => %{ "name" => "John", "age" => 17 } }
    assert HaveRelationships.match(subject, ["name", "age"]) == {true, []}
  end

  test "match not all relationships match" do
    subject = %{ "relationships" => %{ "name" => "John", "age" => 17 } }
    assert HaveRelationships.match(subject, ["name", "age", "pet", "city"]) == {false, ["pet", "city"]}
  end

  test "success_message when positive is true" do
    subject = %{ "relationships" => %{ "name" => "John" } }
    expected = "`%{\"relationships\" => %{\"name\" => \"John\"}}` has relationships name."
    assert HaveRelationships.success_message(subject, ["name"], nil, true) == expected
  end

  test "success_message when positive is false" do
    subject = %{ "relationships" => %{ "name" => "John" } }
    expected = "`%{\"relationships\" => %{\"name\" => \"John\"}}` does not have relationships age."
    assert HaveRelationships.success_message(subject, ["age"], nil, false) == expected
  end

  test "error_message when positive is true" do
    subject = %{ "relationships" => %{ "name" => "John" } }
    expected = "Expected `%{\"relationships\" => %{\"name\" => \"John\"}}` to have relationships [\"age\"]."
    assert HaveRelationships.error_message(subject, nil, ["age"], true) == expected
  end

  test "error_message when positive is false" do
    subject = %{ "relationships" => %{ "name" => "John" } }
    expected = "Expected `%{\"relationships\" => %{\"name\" => \"John\"}}` not to have relationships [\"name\", \"age\"]."
    assert HaveRelationships.error_message(subject, nil, ["name", "age"], false) == expected
  end
end

defmodule EspecJsonapi.Assertions.HaveRelationshipTest do
  use ExUnit.Case
  alias EspecJsonapi.Assertions.HaveRelationship

  test "match when subject is an empty map" do
    assert HaveRelationship.match(%{}, "user") == {false, %{}}
  end

  test "match when subject is another type" do
    assert HaveRelationship.match("invalid", "user") == {false, "invalid"}
  end

  test "match when the subject id matches" do
    subject = %{ "relationships" => %{ "name" => "John", "age" => 17 } }
    assert HaveRelationship.match(subject, "name") == {true, "John"}
  end

  test "success_message when positive is true" do
    subject = %{ "relationships" => %{ "name" => "John" } }
    expected = "`%{\"relationships\" => %{\"name\" => \"John\"}}` has relationship name."
    assert HaveRelationship.success_message(subject, "name", nil, true) == expected
  end

  test "success_message when positive is false" do
    subject = %{ "relationships" => %{ "name" => "John" } }
    expected = "`%{\"relationships\" => %{\"name\" => \"John\"}}` does not have relationship age."
    assert HaveRelationship.success_message(subject, "age", nil, false) == expected
  end

  test "error_message when positive is true" do
    subject = %{ "relationships" => %{ "name" => "John" } }
    expected = "Expected `%{\"relationships\" => %{\"name\" => \"John\"}}` to have relationship age."
    assert HaveRelationship.error_message(subject, "age", nil, true) == expected
  end

  test "error_message when positive is false" do
    subject = %{ "relationships" => %{ "name" => "John" } }
    expected = "Expected `%{\"relationships\" => %{\"name\" => \"John\"}}` not to have relationship name."
    assert HaveRelationship.error_message(subject, "name", nil, false) == expected
  end
end

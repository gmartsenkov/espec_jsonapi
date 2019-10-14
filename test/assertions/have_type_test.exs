defmodule EspecJsonapi.Assertions.HaveTypeTest do
  use ExUnit.Case
  alias EspecJsonapi.Assertions.HaveType

  test "match when subject is an empty map" do
    assert HaveType.match(%{}, 1) == {false, %{}}
  end

  test "match when subject is another type" do
    assert HaveType.match("invalid", "user") == {false, "invalid"}
  end

  test "match when the subject id matches" do
    subject = %{ "type" => "user" }
    assert HaveType.match(subject, "user") == {true, subject}
  end

  test "success_message when positive is true" do
    subject = %{ "type" => "user" }
    expected = "`%{\"type\" => \"user\"}` has a type of user."
    assert HaveType.success_message(subject, "user", nil, true) == expected
  end

  test "success_message when positive is false" do
    subject = %{ "type" => "user" }
    expected = "`%{\"type\" => \"user\"}` does not have a type of user."
    assert HaveType.success_message(subject, "user", nil, false) == expected
  end

  test "error_message when positive is true" do
    subject = %{ "type" => "user" }
    expected = "Expected `%{\"type\" => \"user\"}` to have a type of token."
    assert HaveType.error_message(subject, "token", nil, true) == expected
  end

  test "error_message when positive is false" do
    subject = %{ "type" => "user" }
    expected = "Expected `%{\"type\" => \"user\"}` not to have a type of token."
    assert HaveType.error_message(subject, "token", nil, false) == expected
  end
end

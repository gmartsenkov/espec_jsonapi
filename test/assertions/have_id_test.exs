defmodule EspecJsonapi.Assertions.HaveIdTest do
  use ExUnit.Case
  alias EspecJsonapi.Assertions.HaveId

  test "match when subject is an empty map" do
    assert HaveId.match(%{}, 1) == {false, %{}}
  end

  test "match when subject is another type" do
    assert HaveId.match("invalid", 1) == {false, "invalid"}
  end

  test "match when the subject id matches" do
    subject = %{ "id" => 1 }
    assert HaveId.match(subject, 1) == {true, subject}
  end

  test "success_message when positive is true" do
    subject = %{ "id" => 1 }
    expected = "`%{\"id\" => 1}` has an id of 1."
    assert HaveId.success_message(subject, 1, nil, true) == expected
  end

  test "success_message when positive is false" do
    subject = %{ "id" => 1 }
    expected = "`%{\"id\" => 1}` does not have an id of 1."
    assert HaveId.success_message(subject, 1, nil, false) == expected
  end

  test "error_message when positive is true" do
    subject = %{ "id" => 1 }
    expected = "Expected `%{\"id\" => 1}` to have an id of 2."
    assert HaveId.error_message(subject, 2, nil, true) == expected
  end

  test "error_message when positive is false" do
    subject = %{ "id" => 1 }
    expected = "Expected `%{\"id\" => 1}` not to have an id of 2."
    assert HaveId.error_message(subject, 2, nil, false) == expected
  end
end

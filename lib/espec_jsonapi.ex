defmodule EspecJsonapi do
  alias EspecJsonapi.Assertions.HaveId
  def have_id(id), do: {HaveId, id}
end

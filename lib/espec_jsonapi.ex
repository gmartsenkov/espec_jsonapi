defmodule EspecJsonapi do
  alias EspecJsonapi.Assertions.HaveId
  alias EspecJsonapi.Assertions.HaveType
  alias EspecJsonapi.Assertions.HaveAttribute
  alias EspecJsonapi.Assertions.HaveAttributes
  alias EspecJsonapi.Assertions.WithData
  alias EspecJsonapi.Assertions.HaveRelationship
  alias EspecJsonapi.Assertions.HaveRelationships
  alias EspecJsonapi.Assertions.HaveLink
  alias EspecJsonapi.Assertions.HaveLinks

  def have_id(id), do: {HaveId, id}
  def have_type(type), do: {HaveType, type}
  def have_attribute(attribute), do: {HaveAttribute, attribute}
  def have_attributes(attributes), do: {HaveAttributes, attributes}
  def with_data(matcher, data), do: {WithData, {matcher, data}}
  def with_value(matcher, data), do: {WithData, {matcher, data}}
  def have_relationship(relationship), do: {HaveRelationship, relationship}
  def have_relationships(relationships), do: {HaveRelationships, relationships}
  def have_link(link), do: {HaveLink, link}
  def have_links(links), do: {HaveLinks, links}
end

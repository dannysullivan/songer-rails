class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :upvotes

  def upvotes
    object.upvotes.count
  end
end

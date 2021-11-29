require_relative 'category'

class StudyItem
  attr_reader :id, :title, :category, :description, :done

  @@next_index = 1

  def initialize(title:, category:, description:, done: false)
    @id = @@next_index
    @title = title
    @category = category
    @description = description
    @done = done
  end
end
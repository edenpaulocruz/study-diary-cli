require_relative 'category'

class StudyItem
  attr_accessor :title, :category

  def initialize(title, category)
    @title = title
    @category = category
  end
  
  def show
    puts "#{@category} - #{@title}"
  end
end
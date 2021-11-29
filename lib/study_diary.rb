require 'io/console'
require_relative 'study_item'

ADD_ITEM         = 1
SHOW_ITEMS       = 2
SEARCH_ITEM      = 3
SHOW_BY_CATEGORY = 4
DELETE_ITEM      = 5
FINISH_ITEM      = 6
SHOW_FINISHEDS   = 7
SHOW_ALL         = 8
EXIT             = 9

def clear_screen
  system 'clear'
end

def menu
  puts <<~MENU
    
    -----------------------------------------------------
    [#{ADD_ITEM}] Cadastrar um item para estudar
    [#{SHOW_ITEMS}] Ver os itens a estudar
    [#{SEARCH_ITEM}] Buscar um item de estudo
    [#{SHOW_BY_CATEGORY}] Listar por categoria
    [#{DELETE_ITEM}] Apagar um item
    [#{FINISH_ITEM}] Marcar um item como concluído
    [#{SHOW_FINISHEDS}] Mostrar itens concluídos
    [#{SHOW_ALL}] Ver todos os itens cadastrados
    [#{EXIT}] Sair
    -----------------------------------------------------

  MENU
  print 'Escolha uma opção: '
  gets.to_i
end

def continue
  puts
  puts 'Pressione qualquer tecla para continuar'
  STDIN.getch
  clear_screen
end

def select_category
  puts
  @categories.each { |category| puts "##{category.id} - #{category.name}" }
  print 'Escolha uma categoria: '
  choice = gets.chomp
  @categories.find { |item| item.id == choice.to_i }
end

def add_item
  puts
  print 'Digite o título do seu item de estudo: '
  title = gets.chomp
  puts
  category = select_category
  puts
  puts 'Digite a descrição do seu item de estudo:'
  description = gets.chomp
  StudyItem.new(title, category, description)
end

def show_items(items, status = nil)
  puts
  items = items.select { |item| item.done == status } if status != nil
  puts 'Itens não encontrados.' if items.empty?
  items.each_with_index { |item, index| puts "##{index+1} - #{item.title} - #{item.category.name}#{' - Finalizado' if item.done}\n#{item.description}\n\n" }
end

def search_items(items)
  puts
  print 'Digite uma palavra para procurar: '
  word = gets.chomp.upcase
  search_result(items, word)
end

def search_result(items, search)
  if search.class == String
    search_result = items.select { |item| item.title.upcase.include?(search) || item.description.upcase.include?(search) }
  elsif search.class == Category
    search_result = items.select { |item| item.category == search }
  end
  puts
  puts "Foram encontrados #{search_result.length} itens."
  show_items(search_result, false)
end

def show_by_category(items)
  category = select_category
  search_result(items, category)
end

def delete_item(items)
  show_items(items)
  print 'Selecione o item que deseja apagar: '
  choice = gets.chomp
  items.delete_at(choice.to_i - 1)
end

def finish_item(items)
  show_items(items, false)
  print 'Selecione o item para concluir: '
  choice = gets.chomp
  items[choice.to_i - 1].done = true
end

@categories = [
  Category.new(1, 'HTML'),
  Category.new(2, 'CSS'),
  Category.new(3, 'JavaScript'),
  Category.new(4, 'React'),
  Category.new(5, 'Ruby'),
  Category.new(6, 'Rails'),
  Category.new(7, 'Golang')
]
study_items = []
puts 'Bem-vindo ao Diário de Estudos, seu companheiro para estudar!'
clear_screen
option = menu

loop do
  case option
  when ADD_ITEM
    study_items << add_item
  when SHOW_ITEMS
    show_items(study_items, false)
  when SEARCH_ITEM
    search_items(study_items)
  when SHOW_BY_CATEGORY
    show_by_category(study_items)
  when DELETE_ITEM
    delete_item(study_items)
  when FINISH_ITEM
    finish_item(study_items)
  when SHOW_FINISHEDS
    show_items(study_items, true)
  when SHOW_ALL
    show_items(study_items)
  when EXIT
    break
  else
    puts 'Opção inálida! Tente novamente!'
  end
  continue
  option = menu
end

puts
puts 'Obrigado por utilizar o Diário de Estudos. Até logo!'
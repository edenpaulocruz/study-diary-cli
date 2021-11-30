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
    -------------------------------------------------------------
    [#{ADD_ITEM}] Cadastrar um item para estudar
    [#{SHOW_ITEMS}] Ver os itens a estudar
    [#{SEARCH_ITEM}] Buscar um item de estudo
    [#{SHOW_BY_CATEGORY}] Listar por categoria
    [#{DELETE_ITEM}] Apagar um item
    [#{FINISH_ITEM}] Marcar um item como concluído
    [#{SHOW_FINISHEDS}] Mostrar itens concluídos
    [#{SHOW_ALL}] Ver todos os itens cadastrados
    [#{EXIT}] Sair
    -------------------------------------------------------------
  MENU
  print 'Escolha uma opção: '
  gets.to_i
end

def continue
  puts "\nPressione qualquer tecla para continuar"
  STDIN.getch
  clear_screen
end

def show_items items
  puts "\nItens não encontrados." if items.empty?
  puts items
end

def search_items items
  print "\nDigite uma palavra para procurar: "
  word = gets.chomp.upcase
  search_result items, word
end

def search_result items, search
  if search.class == String
    search_result = items.select { |item| item.title.upcase.include?(search) || item.description.upcase.include?(search) }
  elsif search.class == Category
    search_result = items.select { |item| item.category == search }
  end
  puts "\nForam encontrados #{search_result.length} itens."
  show_items search_result
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

study_items = []
clear_screen
puts 'Bem-vindo ao Diário de Estudos, seu companheiro para estudar!'
option = menu

loop do
  case option
  when ADD_ITEM
    study_items << StudyItem.create
  when SHOW_ITEMS
    show_items study_items
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
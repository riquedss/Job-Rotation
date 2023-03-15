# frozen_string_literal: true

require './Interface/main_interface'
require './Interface/fibonacci_interface'
require './Interface/faturamento_interface'
require './Interface/string_inverse_interface'

def routes(path)
  if path == '1'
    InterfaceFibonacci.call
  elsif path == '2'
    InterfaceFaturamento.call
  else
    InterfaceStringInverse.call
  end
end

flag = true
while flag
  system('clear')
  Mensagem.menu
  print ': '
  escolha = gets.chomp

  if escolha == 's'
    flag = false
  elsif %w[1 2 3 4].include?(escolha)
    routes(escolha)
  else
    puts "\n escolha uma opção válida!\n"
  end
end

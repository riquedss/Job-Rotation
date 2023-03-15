# frozen_string_literal: true

require './string_inverse'

class InterfaceStringInverse
  def self.call
    flag = true
    while flag
      system('clear')
      print("\nPara obter o resultado de uma palavra pelo inversa:\n")
      print('Digite uma palavra: ')
      escolha = gets.chomp
      request(escolha)

      print("\n\nDeseja continuar? (->S/N) ")
      escolha = gets.chomp

      flag = false if %w[n N].include?(escolha)
    end
  end

  def self.request(value)
    puts "\nR: #{value.inverte}\n"
  end
end

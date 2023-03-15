# frozen_string_literal: true

require './Auxiliares/numeric'
require './fibonacci'

class InterfaceFibonacci
  def self.call
    flag = true
    while flag
      system('clear')
      print("\nPara saber se um número pertence ou não à sequência de Fibonacci:\n")
      print('Digite um número inteiro: ')
      escolha = gets.chomp
      request(escolha) if escolha.is_integer?

      print("\n\nDeseja continuar? (->S/N) ")
      escolha = gets.chomp

      flag = false if %w[n N].include?(escolha)
    end
  end

  def self.request(value)
    puts "\nR: #{Fibonacci.new.fibonacci?(value.to_i)}\n"
  end
end

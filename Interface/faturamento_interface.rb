# frozen_string_literal: true

require 'json'
require './faturamento'

class InterfaceFaturamento
  def self.call
    faturamento = Faturamento.new(JSON.parse(File.read('./Db/dados.json')))

    flag = true
    while flag
      system('clear')
      menu
      escolha = gets.chomp
      print ': '

      case escolha
      when '1'
        puts("\nR: #{faturamento.max_faturamento_day}\n")
      when '2'
        puts("\nR: #{faturamento.min_faturamento_day}\n")
      when '3'
        puts("\nR: #{faturamento.media_faturamento}\n")
      when '4'
        faturamento_percentual_interface
      else
        puts "\nR: escolha uma opção válida!\n"
      end

      print("\n\nDeseja continuar? (->S/N) ")
      escolha = gets.chomp

      flag = false if %w[n N].include?(escolha)
    end
  end

  def self.menu
    print("obs: Para esta simulação, o algoritmo está considerando o arquivo dados.json na pasta /Db.\n\n")

    print("(1) para saber o valor do maior dia de faturamento.
(2) para saber o valor do menor dia de faturamento.
(3) para saber o valor da média de faturamento.
(4) para saber em percentual o faturamento de cada estado da sua distribuidora.\n")
  end

  def self.faturamento_percentual_interface
    puts '------------------------------------------------------'
    faturamento_estado = {}

    flag = true
    while flag
      print('Qual a sigla do estado? ')
      chave = gets.chomp
      print('Qual foi o faturamento da distribuidora nesse estado? ')
      valor = gets.chomp
      if valor.is_number?
        faturamento_estado[chave] = valor.to_f
        print("\n\nDeseja adicionar mais estado? (->S/N) ")
        escolha = gets.chomp

        flag = false if %w[n N].include?(escolha)
      else
        puts("\nError: Faturamento não é um número!\n\n")
      end
    end

    calcula_percentual(faturamento_estado)
  end

  def self.calcula_percentual(hash)
    faturamentos = faturamento_total(hash)

    puts("\nResultado:")

    hash.each do |chave, valor|
      puts("#{chave} - Faturou #{(valor / faturamentos) * 100}% do total de distribuidoras.")
    end
  end

  def self.faturamento_total(hash)
    faturamento_all_estados = 0
    hash.each do |_, valor|
      faturamento_all_estados += valor
    end

    faturamento_all_estados
  end
end

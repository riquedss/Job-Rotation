# frozen_string_literal: true

require 'json'

class Faturamento
  def initialize(faturamentos)
    @faturamentos = faturamentos
    @maior = nil
    @menor = nil
    @media = nil
  end

  def max_faturamento_day
    return @maior if @maior

    @maior = -1

    @faturamentos.each do |faturamento|
      @maior = faturamento['valor'] if faturamento['valor'] > @maior
    end

    @maior
  end

  def min_faturamento_day
    return @menor if @menor

    @menor = Float::MAX

    @faturamentos.each do |faturamento|
      @menor = faturamento['valor'] if faturamento['valor'] < @menor
    end

    @menor
  end

  def media_faturamento
    return @media if @media

    soma = 0
    cont = 0
    @faturamentos.each do |faturamento|
      if faturamento['valor'] != 0
        soma += faturamento['valor']
        cont += 1
      end
    end

    @media = soma / cont if cont != 0
  end
end

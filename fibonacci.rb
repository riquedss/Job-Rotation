# frozen_string_literal: true

class Fibonacci
  def initialize
    @cache = { antercessor_ultimo_num_fib: nil, ultimo_num_fib: nil }
  end

  def fibonacci?(value)
    if in_cache?(value)
      return mensage("O #{value} pertence a sequencia de fibonacci!")
    elsif @cache[:ultimo_num_fib] && value > @cache[:ultimo_num_fib]
      fib_atual = @cache[:ultimo_num_fib] + @cache[:antercessor_ultimo_num_fib]
      aux_fib = @cache[:ultimo_num_fib]
    else
      fib_atual = 0
      aux_fib = 1
    end

    while fib_atual < value
      prox = fib_atual
      fib_atual += aux_fib
      aux_fib = prox
    end

    add_in_cache(fib_atual, aux_fib)

    return mensage("O #{value} pertence a sequencia de fibonacci!") if fib_atual == value

    mensage("O #{value} não pertence a sequencia de fibonacci!")
  end

  private

  def add_in_cache(fib_atual, penultimo_fib)
    @cache[:ultimo_num_fib] = fib_atual
    @cache[:antercessor_ultimo_num_fib] = penultimo_fib
  end

  def in_cache?(value)
    true if @cache[:ultimo_num_fib] &&
            (@cache[:ultimo_num_fib] == value || @cache[:antercessor_ultimo_num_fib] == value)
  end

  def mensage(value)
    puts value
  end
end

a = Fibonacci.new

a.fibonacci?(0)
a.fibonacci?(89)
a.fibonacci?(100000)
a.fibonacci?(75025)

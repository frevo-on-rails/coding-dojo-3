class No

  attr_accessor :sim, :nao, :valor

  def initialize(valor)
    @valor = valor
  end

  def animal?
    @sim.nil? and @nao.nil?
  end

  def pergunta?
    not animal?
  end

end

def imprimir_arvore(no)
  return if no.nil?
  puts no.valor

  imprimir_arvore(no.sim)
  imprimir_arvore(no.nao)
end

raiz  = No.new('Cachorro')
pai = nil
no_atual = raiz
while true
  puts "pense em um animal"

  if no_atual.animal?
    puts "vc pensou em #{no_atual.valor}?"
    resposta =  gets.chomp
    if resposta.upcase == "S"
      puts "acertei porra!!"
    else
      puts "qual o animal que vc pensou?"
      animal = No.new(gets.chomp)
      puts "faça uma pergunta que o diferencie de #{no_atual.valor}?"
      pergunta = No.new(gets.chomp)
      pergunta.sim = animal
      pergunta.nao = no_atual

      if pai.nil?
        raiz = pergunta
      elsif no_atual == pai.nao
        pai.nao = pergunta
      elsif no_atual == pai.sim
        pai.sim = pergunta
      end
    end
    no_atual = raiz
  else
    puts no_atual.valor
    resposta = gets.chomp

    pai = no_atual

    if resposta.upcase == "S"
      no_atual = no_atual.sim
    else
      no_atual = no_atual.nao
    end
  end


end


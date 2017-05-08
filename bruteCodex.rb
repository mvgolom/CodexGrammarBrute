arql = File.new("/home/golom/Documentos/Automatos/gramatica/teste automatos/teste1.txt","r")
def lerArq(arq)
  info = arq.readlines()
  deriv = []
  symbol = ""
  dev = ""
  derivation = []
  z = 0
  epsilon = "#"
  for i in 3..info.length-1
      deriv = info[i].split(" ")
      symbol = deriv[0].chomp
      dev = deriv[1].chomp
      derivation[z] = []
      derivation[z][0] = symbol.to_s
      if dev["epsilon"]
        derivation[z][1] = epsilon.to_s
      else
        derivation[z][1] = dev.to_s
      end
  z += 1
  end
  return derivation
end

def addHash(dicionario,palavra)
    dicionario[palavra] = palavra
end

def prod_Generator(teste)
  epsilon = "#"
  gen = 0
  word = teste[0][1]
  words = Array.new
  tmp = ""
  tmp2 = ""
  dicionary = Hash.new
  teste.each do |i, j|
    tmp = word
    if  word[i]
      tmp = tmp.sub(i,j)
      words << tmp
    end
  end
  while gen < 50 do
    teste.each do |i, j|
      tmp2 = words[gen]
      if tmp2[i]
        tmp2 = tmp2.sub(i,j)
        words << tmp2
      end
    end
    gen += 1
  end
  words.each do |palavra|
      teste.each do |i, j|
          if palavra[epsilon]
            addHash(dicionary,palavra)
          end
      end
  end
  return dicionary
end

puts "Informe a palavra"
palavra = gets.chomp
teste = lerArq(arql)
dicionario = prod_Generator(teste)
codex = Array.new
codex = dicionario.keys
teste = false
codex.each do |x|
  x = x.sub("#","")
  if ((x <=> palavra) == 0)
    puts "palavra aceita"
    teste = true
  end
end
if teste == false
  puts "palavra nao aceita"
end

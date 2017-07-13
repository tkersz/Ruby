def da_boas_vindas
	puts "\nBem vindo ao jogo da advinhação!"
	puts "Qual é o seu nome?"
	nome = gets.strip
	puts "\n\n"
	puts "Começaremos o jogo para você, #{nome}" 
	nome	
end

def sorteia_numero_secreto(dificuldade)
 	case dificuldade
 	when 1
        maximo = 30
    when 2
        maximo = 60
    when 3
        maximo = 100
    when 4
        maximo = 150
    else
        maximo = 200
    end
	puts "Escolhendo um número secreto entre 1 e #{maximo}..."
	sorteado = rand(maximo) + 1
	puts "\n"
	puts "Escolhido... que tal advinhar hoje o nosso número secreto?""\n\n"
	sorteado
end

def pede_um_numero(tentativa, limite_de_tentativas)
	puts "\nTentativa #{tentativa} de #{limite_de_tentativas}"
	puts "Entre com o número"
	chute = gets
	puts "\n"
	puts "Será que acertou? Você chutou #{chute}"
	puts "\n"
	chute.to_i
end

def verifica_se_acertou(numero_secreto, chute)
	if numero_secreto == chute
		puts "Parabéns, você acertou!"
		return true
	end
	if numero_secreto > chute
		puts "Errou! O número é maior que #{chute}"
    else
    	puts "Errou! O número é menor que #{chute}"
	end
	false
end

def pede_dificuldade
    puts "Qual o nível de dificuldade que deseja? (1 fácil, 5 difícil)"
    dificuldade = gets.to_i
end

def nao_quer_jogar?
	puts "Deseja jogar novamente?"
	quero_jogar = gets.strip
	nao_quero_jogar = quero_jogar.upcase == "N"
end 

def joga(nome, dificuldade)
	numero_secreto = sorteia_numero_secreto dificuldade

	chutes = []
	limite_de_tentativas = 5
	pontos_ate_agora = 1000

	for tentativa in 1..limite_de_tentativas
		if nome == "Timoteo"
			puts "Parabéns, você acertou!"
			break
		end

		puts "Chutes até agora #{chutes}"
		chute = pede_um_numero tentativa, limite_de_tentativas
		pontos_ate_agora -= (numero_secreto - chute).abs / 2
		chutes << chute

		break if verifica_se_acertou numero_secreto, chute
	end
	puts "Você ganhou #{pontos_ate_agora} pontos"
end

nome = da_boas_vindas
dificuldade = pede_dificuldade

loop do
	joga nome, dificuldade
	break if nao_quer_jogar?
end
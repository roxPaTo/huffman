Instruções para execução do código.

Passo 1: No sheel interativo do Octave execute Main
Passo 2: O script irá lhe conduzir pelas interações pré definidas.
Passo 3: O primeiro experimento irá executar a compactação/descompactação de um arquivo de 50bytes.
Passo 4: Aguarde retornar as estatísticas do experimento e prescione uma tecla par executar o próximo experimento. 
Passo 5: O segundo experimento irá executar a compactação/descompactação de um arquivo de 500bytes.
Passo 6: Aguarde retornar as estatísticas do experimento e prescione uma tecla par executar o próximo experimento.
Passo 7: O terceiro experimento irá executar a compactação/descompactação de um arquivo de 5000bytes.
Passo 8: Aguarde retornar as estatísticas do experimento.
Passo 9: Será solicitado se deseja exibir os gráficos comparativos do experimento. Digite 1 para sim.
Passo 10: Execução finalizada.

- Os arquivos compactados apresentam a terminação .huff
- Caso deseje utilizar o compactador pelo shell interativo do octave utilize o comando:
	Compactador("entradaPequena.txt")
 onde, entradaPequena.txt deve ser substituido pelo arquivo que se deseja compactar.
- Caso deseje utilizar o descompactador pelo shell interativo do octave utilize o comando:
	Descompactador("entradaPequena")
 onde, entradaPequena deve ser substituido pelo nome do arquivo que foi compactado (sem a extensão).


Observação:
 O compactador/descompactador foi testado com arquivos do tipo texto de extensão ".txt". Para executar compactação de outros formatos pode se necessário realizar adaptações no código. 


- Existe ainda a possibilidade de executar as rotinas de Huffman (codificação/decodificação) apenas:

1 - Para gerar o alfabeto: 
	alfabeto = Huffman(simbolos, frequencias);
 onde, os parâmetros simbolos e frequencias são dois vetores ordenados em ordem decrescente de frequencia. 
 ex.:
	simbolos = ['f' 'e' 'c' 'b' 'd' 'a'];
	frequencias = [5 9 12 13 16 45]; 

2 - Para codificar uma sequencia de entrada:
	stringCodificada = Codificar(alfabeto, stringEntrada);
 onde, o parâmetro alfabeto é gerado pela função 1, e stringEntrada é a string que se deseja codificar. A função retorna a string codificada.
 ex.: 
	stringCodificada = Codificar(alfabeto, 'aabe');	

3 - Para decodificar uma sequencia codificada:
	stringDecodificada = Decodificar(alfabeto, stringCodificada);
 onde, o parâmetro alfabeto é gerado pela função 1, e stringCodificada é gerado pela função2. A função retorna a string decodificada.
 ex.: 
	stringDecodificada = Decodificar(alfabeto, stringCodificada);	



Instru��es para execu��o do c�digo.

Passo 1: No sheel interativo do Octave execute Main
Passo 2: O script ir� lhe conduzir pelas intera��es pr� definidas.
Passo 3: O primeiro experimento ir� executar a compacta��o/descompacta��o de um arquivo de 50bytes.
Passo 4: Aguarde retornar as estat�sticas do experimento e prescione uma tecla par executar o pr�ximo experimento. 
Passo 5: O segundo experimento ir� executar a compacta��o/descompacta��o de um arquivo de 500bytes.
Passo 6: Aguarde retornar as estat�sticas do experimento e prescione uma tecla par executar o pr�ximo experimento.
Passo 7: O terceiro experimento ir� executar a compacta��o/descompacta��o de um arquivo de 5000bytes.
Passo 8: Aguarde retornar as estat�sticas do experimento.
Passo 9: Ser� solicitado se deseja exibir os gr�ficos comparativos do experimento. Digite 1 para sim.
Passo 10: Execu��o finalizada.

- Os arquivos compactados apresentam a termina��o .huff
- Caso deseje utilizar o compactador pelo shell interativo do octave utilize o comando:
	Compactador("entradaPequena.txt")
 onde, entradaPequena.txt deve ser substituido pelo arquivo que se deseja compactar.
- Caso deseje utilizar o descompactador pelo shell interativo do octave utilize o comando:
	Descompactador("entradaPequena")
 onde, entradaPequena deve ser substituido pelo nome do arquivo que foi compactado (sem a extens�o).


Observa��o:
 O compactador/descompactador foi testado com arquivos do tipo texto de extens�o ".txt". Para executar compacta��o de outros formatos pode se necess�rio realizar adapta��es no c�digo. 


- Existe ainda a possibilidade de executar as rotinas de Huffman (codifica��o/decodifica��o) apenas:

1 - Para gerar o alfabeto: 
	alfabeto = Huffman(simbolos, frequencias);
 onde, os par�metros simbolos e frequencias s�o dois vetores ordenados em ordem decrescente de frequencia. 
 ex.:
	simbolos = ['f' 'e' 'c' 'b' 'd' 'a'];
	frequencias = [5 9 12 13 16 45]; 

2 - Para codificar uma sequencia de entrada:
	stringCodificada = Codificar(alfabeto, stringEntrada);
 onde, o par�metro alfabeto � gerado pela fun��o 1, e stringEntrada � a string que se deseja codificar. A fun��o retorna a string codificada.
 ex.: 
	stringCodificada = Codificar(alfabeto, 'aabe');	

3 - Para decodificar uma sequencia codificada:
	stringDecodificada = Decodificar(alfabeto, stringCodificada);
 onde, o par�metro alfabeto � gerado pela fun��o 1, e stringCodificada � gerado pela fun��o2. A fun��o retorna a string decodificada.
 ex.: 
	stringDecodificada = Decodificar(alfabeto, stringCodificada);	



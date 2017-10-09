## Copyright (C) 2016 thiago.basso
## 
## Author: thiago <thiago.basso@gmail.com>
## Created: 2016-09-17

%algoritmo de Huffman retirado do livro "Algoritmos: Teoria e Prática"
%de Thomas H. Cormen, et. al. 3ed.
function [alfabeto] = Huffman (elementos, frequencia)
  alfabeto = criaVetorAlfabeto(elementos, frequencia);
  n = length(alfabeto);
  for i=1:n-1 %cria árvore de huffman
    z.esquerda = alfabeto(1); %assumo que a entrada está ordenada 
    z.direita = alfabeto(2);
    z.frequencia = alfabeto(1).frequencia + alfabeto(2).frequencia;
    z.elemento = "";
    alfabeto = insereAlfabeto(alfabeto, z); %insere os nós na árvore de hurrman
  endfor
endfunction

%com base na tabela de símbolos/frequencias é criada a fila de prioridade com todos os nós folhas
function [alfabeto] = criaVetorAlfabeto(elementos, frequencia) %alfabeto para árvore de huffman
  for i=1:length(elementos)
    no.elemento = elementos(i);
    no.frequencia = frequencia(i);
    no.esquerda = "";
    no.direita = "";
    alfabeto(i) = no;
  endfor
endfunction

%metódo que insere o novo objeto/nó na posição correta da fila de prioridades/árvore
function [alfabeto] = insereAlfabeto(alfabeto, z)
  %remove dois primeiros elementos, pois assumo que eles são os mínimos
  alfabeto = alfabeto(3:end);
  indice = 0;

  %procura posicao de z no alfabeto
  for i=1:length(alfabeto)
    if z.frequencia < alfabeto(i).frequencia
      indice = i;
      break;
    end
  endfor

  %aloca no z no local correto
  if indice==0 %quando seu lugar eh no fim
    alfabeto = [alfabeto z]; 
  else
    alfabetoFim = alfabeto(indice:end);
    alfabeto(indice) = z;
    alfabeto = [alfabeto(1:indice) alfabetoFim(1:end)];
  end
endfunction
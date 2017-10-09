## Copyright (C) 2016 thiago.basso
## 
## Author: thiago <thiago.basso@gmail.com>
## Created: 2016-09-17

%recebe a árvore de prefixos e de posse da string retorna sua codificação
function [str] = Codificar (alfabeto, stringEntrada) 
  tabelaEncode = preOrdem(alfabeto, "", ""); %gera tabela de encode  
  str = "";
  for i=1:length(stringEntrada) %percorro a tabela para encontrar o código de cada caractere e concatena-lo na string de saída (codificada)
    str = strcat(str, percorreTabela(tabelaEncode, stringEntrada(i)));
    %str = [str; percorreTabela(tabelaEncode, stringEntrada(i))]; 
  endfor
endfunction

%percore a árvore para gerar a tabela de prefixos de modo a facilitar a codificação
function [codigo] = percorreTabela(tabelaEncode, caractere)
  codigo = "";
  for i=1:length(tabelaEncode) %preciso percorrer toda a tabela para gerar o código relacionado
    if mod(i,2) != 0
      if (str2num(tabelaEncode(i,:)) == caractere)
        %codigo = dec2bin(str2num(tabelaEncode(i+1,[1:end])));
        codigo = tabelaEncode(i+1,[1:end]); 
        break;
      endif
    endif
  endfor
endfunction

%percorre a árvore em pré ordem para montar a tabela de prefixos
function [cods] = preOrdem(no, codigo, cods)
  if !isempty(no)
    if isempty(no.esquerda) && isempty(no.direita)
      cods = [cods; int2str(no.elemento); codigo];%aqui seria mais fáil se tivesse uma estrutura de hashmap ou hashtable
      return;   
    endif    
    cods = preOrdem(no.esquerda, strcat(codigo,'0'), cods);
    cods = preOrdem(no.direita, strcat(codigo,'1'), cods);
  endif
endfunction
## Copyright (C) 2016 thiago.basso
## 
## Author: thiago <thiago.basso@gmail.com>
## Created: 2016-09-17

%percorre a árvore de prefixos para decodificar a string
function [str] = Decodificar (alfabeto, stringEntrada)
  str = "";
  no = alfabeto;
  for i=1:length(stringEntrada)
    if stringEntrada(i) == '0'
      no = no.esquerda;
      if isempty(no.esquerda) && isempty(no.direita)
        str = [str cast(no.elemento,'char')];
        no = alfabeto;
      endif
    endif
    
    if stringEntrada(i) == '1'
      no = no.direita;
      if isempty(no.esquerda) && isempty(no.direita)
        str = [str cast(no.elemento,'char')];
        no = alfabeto;
      endif
    endif
  endfor
endfunction
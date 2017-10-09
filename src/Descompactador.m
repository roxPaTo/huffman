## Copyright (C) 2016 thiago.basso
## 
## Author: thiago <thiago.basso@gmail.com>
## Created: 2016-09-22

%rotina base para descompactação
function [tamanhoTextoSaida] = Descompactador (path)
  arquivoEntrada = strcat('compactado', path, '.huff');
  [simbolosFrequenciaOrdenado,textoEntrada] = gerenciaArquivoEntrada(arquivoEntrada); 
  
  simbolos = simbolosFrequenciaOrdenado(:,1).'; %entrada para árovre de huffman
  frequencias = simbolosFrequenciaOrdenado(:,2).'; %entrada para árovre de huffman
  alfabeto = Huffman(simbolos, frequencias); %árvore de huffman 
  
  textoSaida = Decodificar(alfabeto, textoEntrada);
  gerenciaArquivoSaida(strcat('saida', path, '.txt'), textoSaida);
  
  tamanhoTextoSaida = length(textoSaida);
endfunction

%percorre o arquivo codificado extraindo o cabeçalho (tabela de símbolos e frequências) 
%e o texto a ser decodificado
function [retorno , texto] = gerenciaArquivoEntrada(path)
  file = fopen(path, 'r');
  simbolos = [];
  frequencias = [];
  linha = fgetl(file);
  linha = fgetl(file);
  
  for i=1:str2num(linha);
    linha = fgetl(file);
    flag = 1;
    simbolo = "";
    frequencia = "";
    
    for j=1:length(linha)
      if linha(j) == ";"
        flag = 0;
      endif
      if flag == 1
        simbolo = [simbolo linha(j)];
      else
        frequencia = [frequencia linha(j)];
      end
    endfor
    simbolos = [simbolos str2num(simbolo)]; %entrada para árovre de huffman
    frequencias = [frequencias str2num(frequencia(2:end))]; %entrada para árovre de huffman
  endfor
  
  %texto = fgetl(file);
  %fclose(file);

  texto = fread(file);
  fclose(file);
  ultimosBits = char(texto(end));
  texto = texto([1:end-2]);
  texto = converteByteEmCaracteresZU(texto, ultimosBits);
  
  retorno = [simbolos.', frequencias.'];
endfunction

%escreve o arquivo decodificado
function ans = gerenciaArquivoSaida(path, textoDecodificado)
  file = fopen(path, 'w');
  %escreve o texto decodificado
  fwrite(file,textoDecodificado,'char');
  fclose(file);
endfunction

%converte 1 byte em um vetor de caracteres 0’s e 1’s
%rotina traduzida do código em c disponibilizado pelos professores
function codeF = converteByteEmCaracteresZU(texto, ultimosBits)
  code = dec2bin(int16(texto));
  sizeLstBts = str2num(ultimosBits);
  [l c] = size(code);
  codeF = code(1,:);
  for(i=2:l-1)
   codeF = [codeF code(i,:)];
  end
  codeF = [codeF code(l,1:sizeLstBts)];
endfunction
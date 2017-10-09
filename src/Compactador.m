## Copyright (C) 2016 thiago.basso
## 
## Author: thiago <thiago.basso@gmail.com>
## Created: 2016-09-20

%rotina base para compactação
function [tamanhoEntrada, tamanhoEntradaCodificada] = Compactador (path)
  arquivoEntrada = path;
  path = path(1:end-4);
  [simbolosFrequenciaOrdenado,textoEntrada] = gerenciaArquivoEntrada(arquivoEntrada);
  
  simbolosFrequenciaOrdenado = ordenarBubbleSort(simbolosFrequenciaOrdenado);
  tamanhoEntrada = length(textoEntrada);
  
  simbolos = simbolosFrequenciaOrdenado(:,1).'; %entrada para árovre de huffman
  frequencias = simbolosFrequenciaOrdenado(:,2).'; %entrada para árovre de huffman

  alfabeto = Huffman(simbolos, frequencias); %árvore de huffman

  entradaCodificada = Codificar(alfabeto, textoEntrada); %codifica a entrada
  tamanhoEntradaCodificada = length(entradaCodificada);
  
  arquivoSaida = strcat('compactado', path, '.huff');
  gerenciaArquivoSaida(arquivoSaida, entradaCodificada, simbolos, frequencias);
endfunction

%abre arquivo de entrada e extrai a tabela de símbolos e frequências 
function [retorno , texto] = gerenciaArquivoEntrada(path)
  file = fopen(path, 'rt');
  texto = fread(file);
  fclose(file);
  
  listaSimbolos = unique(texto);
  histograma = hist(texto, listaSimbolos);
  %probabilidades = histograma/length(texto); %estava dando problema nas casas decimais quando fazia cast para gravar do arquivo e recuperar.
  probabilidades = histograma;
  probabilidades = probabilidades.';
  
  retorno = [listaSimbolos, probabilidades];
endfunction

%ordena a tabela de símbolos/frequências para que a extração da fila de prioridade possa ser feita
%removendo os primeiros objetos
%
%levando em conta que o ASCII tem 256 caracteres, não dei muita prioridade em implementar um algoritmo 
%mais eficiente para ordenações, para tanto, utilizei o algoritmo de ordenação que foi trabalhado em sala cuja complexidade é O(n^2).
function [retorno] = ordenarBubbleSort(matriz) %retorno minha matriz de modo que os simbolos estejam ordenados pela frequência
  simbolos = matriz(:,1).';
  frequencia = matriz(:,2).';

  n = length(frequencia);
  for(i=1:n) %Varreduras
    for(j=1:n-i) %Verificações
        if(frequencia(j) > frequencia(j+1))
          temp = frequencia(j);
          frequencia(j) = frequencia(j+1);
          frequencia(j+1) = temp;
          
          temp2 = simbolos(j);
          simbolos(j) = simbolos(j+1);
          simbolos(j+1) = temp2;
        end
    end  
  end

  retorno = [simbolos.', frequencia.'];
end

%salva o arquivo codificado com a extensão ".huff"
function ans = gerenciaArquivoSaida(path, textoCodificado, simbolo, frequencia)
  file = fopen(path, 'wb', 'ieee-be');
  %escreve cabeçalho para descompactação
  fwrite(file,"Huffman1.0\n");
  fwrite(file,strcat(num2str(length(frequencia)),"\n"));
  for i=1:length(frequencia)
    fwrite(file,strcat(num2str(uint8(simbolo(i))),";",num2str(frequencia(i)),"\n"));  
  endfor
  
  %escreve o texto codificado
  %fwrite(file,textoCodificado);
  
  [converted sizeLastsBits] = convertByte(textoCodificado, 8);
  for( i=1:length(converted) )
  %  disp(converted(i))
  %  disp(char(converted(i)));
    fwrite(file,char(converted(i)));
  end
  fprintf(file,"\n%i",sizeLastsBits);
  
  fclose(file);
endfunction

%recebe um agrupamento de 8 bits e o converte para 1 byte
%rotina disponibilizado pelos professores
function [converted sizeLastsBits] = convertByte(vector,nbits)
  indices=getParts(vector,nbits);
  n=size(indices,1);
  
  for(i=1:n)
    code = vector(indices(i,1):indices(i,2));
    if(length(code)<nbits)
      sizeLastsBits = length(code);
      for(shif=1:nbits-length(code))
        code = dec2bin(bitshift(bin2dec(code),1));
      end
    end
    value = bin2dec(code);
    converted(i)=value;
  end
end

%agrupa o texto codificado em 8bits para codificar em um único byte, reduzindo assim, o tamanho do arquivo de saída
function indices = getParts(vector, nbits)
  n=length(vector);
  start=1;
  ends=(start-1)+nbits;
  
  i=1;
  indices(i++,:)=[start ends];
  while( (ends+1)<=n )
    start=ends+1;
    ends=(start-1)+nbits;
    indices(i++,:)=[start min(ends,n)];
  end
end
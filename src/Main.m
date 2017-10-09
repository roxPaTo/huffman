fprintf('\n ----------/(arquivo pequeno)/---------- \n\n');

tempoCompactador(1,:)=[0 0];
tempoDescompactador(1,:)=[0 0];
t1 = tic;
[tamanhoEntrada,tamanhoEntradaCodificada] = Compactador("entradaPequena.txt");
tempo = toc(t1);
fprintf('Testando uma entrada pequena de %s bytes \n', (int2str(tamanhoEntrada)));
fprintf('Tamanho do arquivo compactado: %s bytes \n', (num2str(tamanhoEntradaCodificada/8)));
fprintf('Tempo gasto na compactacao: %s segundos \n', (num2str(tempo)));
fprintf('Taxa de compactacao: %s%s \n', num2str(100 - ((100*tamanhoEntradaCodificada)/(tamanhoEntrada*8))), '%');
tempoCompactador(2,:)=[tamanhoEntrada tempo];
taxaCompactacaoX = (tamanhoEntradaCodificada);
taxaCompactacaoY = (100 - ((100*tamanhoEntradaCodificada)/(tamanhoEntrada*8)));

t1 = tic;
tamanhoSaidaDecodificada = Descompactador("entradaPequena");
tempo = toc(t1);
fprintf('Tamanho do arquivo descompactado: %s bytes \n', (int2str(tamanhoSaidaDecodificada)));
fprintf('Tempo gasto para descompatar: %d segundos \n', tempo);
tempoDescompactador(2,:)=[tamanhoSaidaDecodificada tempo];

fprintf('\n ----------/(arquivo medio)/---------- (aperte qualquer tecla para continuar...)\n\n');
pause;

t1 = tic;
[tamanhoEntrada,tamanhoEntradaCodificada] = Compactador("entradaMedia.txt");
tempo = toc(t1);
fprintf('Testando uma entrada media de %s bytes \n', (int2str(tamanhoEntrada)));
fprintf('Tamanho do arquivo compactado: %s bytes \n', (num2str(tamanhoEntradaCodificada/8)));
fprintf('Tempo gasto na compactacao: %s segundos \n', (num2str(tempo)));
fprintf('Taxa de compactacao: %s%s \n', num2str(100 - ((100*tamanhoEntradaCodificada)/(tamanhoEntrada*8))), '%');
tempoCompactador(3,:)=[tamanhoEntrada tempo];
taxaCompactacaoX = [taxaCompactacaoX tamanhoEntradaCodificada];
taxaCompactacaoY = [taxaCompactacaoY (100 - ((100*tamanhoEntradaCodificada)/(tamanhoEntrada*8)))];

t1 = tic;
tamanhoSaidaDecodificada = Descompactador("entradaMedia");
tempo = toc(t1);
fprintf('Tamanho do arquivo descompactado: %s bytes \n', (int2str(tamanhoSaidaDecodificada)));
fprintf('Tempo gasto para descompatar: %d segundos \n', tempo);
tempoDescompactador(3,:)=[tamanhoSaidaDecodificada tempo];

fprintf('\n ----------/(arquivo intermediario)/---------- (aperte qualquer tecla para continuar...)\n\n');
pause;

t1 = tic;
[tamanhoEntrada,tamanhoEntradaCodificada] = Compactador("entradaIntermediaria.txt");
tempo = toc(t1);
fprintf('Testando uma entrada media de %s bytes \n', (int2str(tamanhoEntrada)));
fprintf('Tamanho do arquivo compactado: %s bytes \n', (num2str(tamanhoEntradaCodificada/8)));
fprintf('Tempo gasto na compactacao: %s segundos \n', (num2str(tempo)));
fprintf('Taxa de compactacao: %s%s \n', num2str(100 - ((100*tamanhoEntradaCodificada)/(tamanhoEntrada*8))), '%');
tempoCompactador(4,:)=[tamanhoEntrada tempo];
taxaCompactacaoX = [taxaCompactacaoX tamanhoEntradaCodificada];
taxaCompactacaoY = [taxaCompactacaoY (100 - ((100*tamanhoEntradaCodificada)/(tamanhoEntrada*8)))];

t1 = tic;
tamanhoSaidaDecodificada = Descompactador("entradaIntermediaria");
tempo = toc(t1);
fprintf('Tamanho do arquivo descompactado: %s bytes \n', (int2str(tamanhoSaidaDecodificada)));
fprintf('Tempo gasto para descompatar: %d segundos \n', tempo);
tempoDescompactador(4,:)=[tamanhoSaidaDecodificada tempo];

fprintf('\n ----------/(arquivo grande)/---------- (aperte qualquer tecla para continuar...)\n\n');
pause;

t1 = tic;
[tamanhoEntrada,tamanhoEntradaCodificada] = Compactador("entradaGrande.txt");
tempo = toc(t1);
fprintf('Testando uma entrada grande de %s bytes \n', (int2str(tamanhoEntrada)));
fprintf('Tamanho do arquivo compactado: %s bytes \n', (num2str(tamanhoEntradaCodificada/8)));
fprintf('Tempo gasto na compactacao: %s segundos \n', (num2str(tempo)));
fprintf('Taxa de compactacao: %s%s \n', num2str(100 - ((100*tamanhoEntradaCodificada)/(tamanhoEntrada*8))), '%');
tempoCompactador(5,:)=[tamanhoEntrada tempo];
taxaCompactacaoX = [taxaCompactacaoX tamanhoEntradaCodificada];
taxaCompactacaoY = [taxaCompactacaoY (100 - ((100*tamanhoEntradaCodificada)/(tamanhoEntrada*8)))];

t1 = tic;
tamanhoSaidaDecodificada = Descompactador("entradaGrande");
tempo = toc(t1);
fprintf('Tamanho do arquivo descompactado: %s bytes \n', (int2str(tamanhoSaidaDecodificada)));
fprintf('Tempo gasto para descompatar: %d segundos \n\n', tempo);
tempoDescompactador(5,:)=[tamanhoSaidaDecodificada tempo];

resp = input('Deseja exibir os graficos estatisticos? (1-Sim)');
disp(resp);

if (resp == 1)
  subplot(2,2,1); %Tempo para Compactar
  plot(tempoCompactador(:,1),tempoCompactador(:,2),'-b'); hold on;
  title('Tempo para Compactar');
  xlabel('Tamanho do arquivo de entrada (em bytes)');
  ylabel('Tempo gasto em segundos (s)');
  plot(tempoCompactador(:,1),tempoCompactador(:,2),'db');

  subplot(2,2,2); %Tempo para Descompactar
  plot(tempoDescompactador(:,1),tempoDescompactador(:,2),'-b'); hold on;
  title('Tempo para Descompactar');
  xlabel('Tamanho do arquivo de saida (em bytes)');
  ylabel('Tempo gasto em segundos (s)');
  plot(tempoDescompactador(:,1),tempoDescompactador(:,2),'db');
  
  subplot(2,2,3); %Taxa de compactação
  bar(taxaCompactacaoX,taxaCompactacaoY);
  title('Taxa de compactacao');
  xlabel('Tamanho do arquivo compactado (em bits)');
  ylabel('Taxa de compactacao (%)');
endif
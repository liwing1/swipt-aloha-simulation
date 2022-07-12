function [cont, dev] = InicializaDispositivos(n,nslots)
  
  cont = zeros(1,nslots);
  
  for i = 1:n
    dev(i).battery = 1;
    dev(i).packet = 0; % 0 não transmite - 1 transmite
    dev(i).distance = 5*rand(); % distância ao ponto de acesso
    dev(i).fading = -log(rand()); % desvanecimento
    dev(i).blocked = 0; % 0 nao bloqueado - 1 bloquead
  endfor
  
endfunction

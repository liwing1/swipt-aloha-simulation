%função principal que recebe como parâmetros: número de dispositivos, taxa de
%chegada de pacotes no canal e número de slots
function res = simulation(numberDevices, arrivalRate, slots, rechargeRate)
  res = zeros(1,slots);
  idxLastTx = zeros(1, numberDevices);
  countSuccesTx = 0;
  countFailTx = 0;
  C = 0; % número de dispositivos descarregados
  energyPackets = 0;

%inicializa os dispositivos e o vetor número de transmissores por slot
  [cont_tx_slot, device] = InicializaDispositivos(numberDevices,slots);


%laço principal em que cada incremento é a representação de um tempo de slot
  for t = 1:slots

    device = packetGeneration(numberDevices, arrivalRate, device);

    % Primeiro for -> Transmite pacotes
    for i = 1:numberDevices
      if(device(i).packet == 1 && device(i).battery == 1 && device(i).blocked == 0)
        cont_tx_slot(t) = cont_tx_slot(t) + 1;
        idxLastTx(cont_tx_slot(t)) = i;
        device(i).battery = 0;
      %else
        %device(i).packet = packetGeneration(arrivalRate);
      endif
    endfor

    C = C + cont_tx_slot(t);  %C = Total de transmissoes

    % Verifica se o pacote transmite foi valido
    if(cont_tx_slot(t) == 1)
      countSuccesTx = countSuccesTx + 1;
      device(idxLastTx(1)).packet = 0;
    elseif(cont_tx_slot(t) > 1)
      countFailTx = countFailTx + 1;
      for i = idxLastTx
        if(i != 0)
          device(i).blocked = 1;
        endif
      endfor
    endif

    % Recarrega os dispositivos
    for i = 1:numberDevices
      if (device(i).battery < 1)
        %device(i).battery = device(i).battery + (0.02*randi([1,10]));
        device(i).battery = device(i).battery + (rechargeRate);
        if (device(i).battery > 1)
          device(i).battery = 1;
        endif
        %device(i).energy = device(i).energy + n*(Ptx)*(Gt)*(Gr)*((c/4*pi*f*d0)^2)*((d0/du)^alpha) * T
      endif
    endfor

  idxLastTx = zeros(1, numberDevices);
  endfor

  res = countSuccesTx/slots;

endfunction

%prob falha = 1 - (1-pL)^L

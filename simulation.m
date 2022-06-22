%função principal que recebe como parâmetros: número de dispositivos, taxa de
%chegada de pacotes no canal e número de slots
function res = simulation(numberDevices, arrivalRate, slots)
  res = zeros(1,slots);
  idxLastTx = 0;
  countSuccesTx = 0;
  countFailTx = 0;
  C = 0; % número de dispositivos descarregados
  energyPackets = 0;

%inicializa os dispositivos e o vetor número de transmissores por slot
  [cont_tx_slot, device] = InicializaDispositivos(numberDevices,slots);


%laço principal em que cada incremento é a representação de um tempo de slot
  for t = 1:slots
    device = packetGeneration(numberDevices, arrivalRate, device);
    for i = 1:numberDevices
      if(device(i).packet == 1 && device(i).battery == 1)
        device(i).battery = 0;
        idxLastTx = i;
        cont_tx_slot(t) = cont_tx_slot(t) + 1;
      endif
    endfor

    C = C + cont_tx_slot(t);  %C = Total de transmissoes

    if (cont_tx_slot(t) > 0)  %Transmitiu algum pkt entao chegou ACK ou NACK
      if(cont_tx_slot(t) == 1)
        countSuccesTx = countSuccesTx + 1;
        device(idxLastTx).packet = 0;
      endif
      for i = 1:numberDevices
        if (device(i).battery < 1)
          device(i).battery = device(i).battery + 0.2;
          %device(i).energy = device(i).energy + n*(Ptx)*(Gt)*(Gr)*((c/4*pi*f*d0)^2)*((d0/du)^alpha) * T
        endif
      endfor
    else
      countFailTx = countFailTx + 1;
    endif
  endfor

  res = cont_tx_slot;


endfunction

%prob falha = 1 - (1-pL)^L

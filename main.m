NUMBER_OF_SAMPLES = 20;

sample = zeros(10, NUMBER_OF_SAMPLES);

for k = 1:10
  
  for i = 1:NUMBER_OF_SAMPLES
    
    for j = 1:10
      sample(k,i) += (simulation(100, 0.1*i, 1000, 0.01*k)/1000);
    endfor
    
    sample(k,i) /= j;
    
  endfor
  
endfor

%plot((0.1:0.1:NUMBER_OF_SAMPLES/10), sample);
%xlabel("arrivalRate");
%ylabel("SuccesRate");
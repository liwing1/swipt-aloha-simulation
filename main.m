NUMBER_OF_SAMPLES = 20;

sample = zeros(1, NUMBER_OF_SAMPLES);

for i = 1:NUMBER_OF_SAMPLES
  for j = 1:10
    sample(i) += (simulation(100, 0.1*i, 1000)/1000);
  endfor
  sample(i) /= j;
endfor

xlabel("lambda");
ylabel("SuccesRate");
plot((1:NUMBER_OF_SAMPLES), sample);
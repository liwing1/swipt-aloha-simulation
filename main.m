NUMBER_OF_SAMPLES = 20;

sample = zeros(10, NUMBER_OF_SAMPLES);

% SIMULATE RECHARGE RATE
%{
for k = 1:10
  
  for i = 1:NUMBER_OF_SAMPLES
    
    for j = 1:10
      sample(k,i) += (simulation(100, 0.1*i, 1000, 0.01*k));
    endfor
    
    sample(k,i) /= j;
    
  endfor
  
endfor
%}

% SIMULATE RECHARGE RATE

for k = 2:2:6
  
  for i = 1:NUMBER_OF_SAMPLES
    
    for j = 1:10
      sample(k,i) += (simulation(10^k, 0.1*i, 1000, 0.1));
    endfor
    
    sample(k,i) /= j;
    
  endfor
  
endfor



y = (0.1:0.1:NUMBER_OF_SAMPLES/10);
plot(y,sample(2,:),'ro-', y,sample(4,:),'go-', y,sample(6,:),'bo-', y,sample(8,:),'rs-', y,sample(10,:),'gs-' );
h = legend("2%", "4%", "6%", "8%", "10%");
legend(h, "location", "southeast");
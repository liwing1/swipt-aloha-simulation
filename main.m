NUMBER_OF_SAMPLES = 30;
NUMBER_OF_MEAN = 2;

sample = zeros(10, NUMBER_OF_SAMPLES);

% SIMULATE RECHARGE RATE

n = [1;5;12];

for k = 1:3

  for i = 1:NUMBER_OF_SAMPLES

    for j = 1:NUMBER_OF_MEAN
      sample(k,i) += (simulation(200, 0.1*i, 100000, 0.01*n(k)));
    endfor

    sample(k,i) /= NUMBER_OF_MEAN;

    printf("k = %d; i = %02d\r\n", k, i);

  endfor

endfor

y = (0.1:0.1:NUMBER_OF_SAMPLES/10);
plot(y,sample(1,:),'ro-', y,sample(2,:),'go-', y,sample(3,:),'bo-');
h = legend("1", "5", "12");
legend(h, "location", "southeast");
xlabel("arrivalRate");
ylabel("succesRate");
title("Recharge Rate - 200 Devices");

% SIMULATE NUMBER DEVICES
%{
n = [50;100;200];

for k = 1:3

  for i = 1:NUMBER_OF_SAMPLES

    for j = 1:NUMBER_OF_MEAN
      sample(k,i) += (simulation(n(k), 0.1*i, 1000, 0.1));
    endfor

    sample(k,i) /= NUMBER_OF_MEAN;

  endfor

endfor

y = (0.1:0.1:NUMBER_OF_SAMPLES/10);
plot(y,sample(1,:),'ro-', y,sample(2,:),'go-', y,sample(3,:),'bo-');
h = legend("50", "100", "200");
legend(h, "location", "southeast");
xlabel("arrivalRate");
ylabel("succesRate");
title("Number of Devies")
%}

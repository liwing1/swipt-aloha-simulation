function dev = packetGeneration(n, r, disp)
  s = randp(r/n, 1, n);
  %s
  for i = 1:n
    if(s(i) >= 1 && disp(i).battery == 1)
      disp(i).packet = 1;
      disp(i).blocked = 0;
    endif
  endfor
  dev = disp;
endfunction

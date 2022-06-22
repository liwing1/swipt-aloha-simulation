function dev = packetGeneration(n, r, disp) 
  a = rand(1,n);
  s = -log(a)./(r/n);
  %s
  for i = 1:n
    if(s(i) > 1)
      disp(i).packet = 0;
    else 
      if(disp(i).battery == 0)
        disp(i).packet = 0;
      else
        disp(i).packet = 1;
      endif
    endif
    %disp(i).packet
  endfor
  dev = disp;
endfunction

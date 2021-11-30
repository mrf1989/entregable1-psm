function h = lp_filter(L, fc, window)
  M = (L-1)/2;
  n = 0:L-1;
  h = 2*fc*sinc(2*fc*(n-M));
  
  switch window
    case 'Hann'
      w = hann_window(n, L);
    case 'Hamming'
      w = hamming_window(n, L);
    case 'Blackman'
      w = blackman_window(n, L);
    otherwise
      w = ones(1, L);
  end
      
  h = h .* w;
end

function w = hann_window(n, L)
  w = 0.5 - 0.5*cos(2*pi*n/(L-1));
end

function w = hamming_window(n, L)
  w = 0.53836 - 0.46164*cos(2*pi*n/(L-1));
end

function w = blackman_window(n, L)
  w = 0.42 - 0.5*cos(2*pi*n/(L-1)) + 0.08*cos(4*pi*n/(L-1));
end

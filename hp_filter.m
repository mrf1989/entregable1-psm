function h = hp_filter(L, fc, window)
  if nargin == 2
    window = 'Square';
  end
  aux = lp_filter(L, fc, window);
  H = fft(aux);
  h = 1 - abs(H);
end
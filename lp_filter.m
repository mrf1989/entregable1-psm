function [h, H] = lp_filter(L, fc)
  M = (L-1)/2;
  n = 0:L-1;
  h = 2*fc*sinc(2*fc*(n-M));
  % Falta utilizar una ventana de filtrado
  H = fft(h);
end

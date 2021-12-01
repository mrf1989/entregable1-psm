function H = bp_filter(L, fb, fa, window)
  if nargin == 3
    window = 'Square';
  end
  Hlp = fft(lp_filter(L, fa, window));
  Hhp = hp_filter(L, fb);
  H = Hlp .* Hhp;
end
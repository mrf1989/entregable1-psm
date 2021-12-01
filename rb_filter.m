function h = rb_filter(L, fb, fa, window)
  if nargin == 3
    window = 'Square';
  end
  Hbp = bp_filter(L, fb, fa, window);
  H = 1 - abs(Hbp);
  h = ifft(H);
end
function fq_shifted_audio = fq_shift(x, F)
  N = length(x);
  n = 0:N-1;
  w = exp(j*2*pi*F*n/N);
  for i = n
    fq_shifted_audio(i+1) = w(i+1) * x(i+1);
  end
end
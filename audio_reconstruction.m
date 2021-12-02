function audio_reconstruction(in, shift, L)
  [x Fs] = audioread(in);
  %X = fft(x);
  %figure();
  %stem(abs(X));
  h = hp_filter(L, 0.125, 'Hann');
  x = conv(h, x);
  X = 2*fft(x);
  %figure();
  %stem(abs(X));
  Xl = circshift(X, -shift);  
  reconstructed_audio = ifft(Xl);
  h = lp_filter(L, 0.06, 'Hann');
  reconstructed_audio = conv(h, reconstructed_audio);
  audiowrite('audio/3-reconstructed_audio.wav', reconstructed_audio, Fs);
  str = ['reconstrucción del audio original filtrado'];
  audio_analysis('audio/3-reconstructed_audio.wav', str);
end

function audio_reconstruction(in, shift, L)
  [x Fs] = audioread(in);
  X = fft(x);
  Xl = circshift(X, -shift);
  h = hp_filter(L, 0.125, 'Hann');
  Xlf = conv(h, Xl);
  reconstructed_audio = 100*ifft(Xlf);
  %reconstructed_audio = ifft(Xl);
  audiowrite('audio/3-reconstructed_audio.wav', reconstructed_audio, Fs);
  str = ['reconstrucción del audio original filtrado'];
  audio_analysis('audio/3-reconstructed_audio.wav', str);
end

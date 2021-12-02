function audio_reconstruction(audio_signal, shift, L, Fs)
  [x Fs] = audioread(audio_signal);
  
  X = fft(x);
  Xl = circshift(X, -shift);
  xl = ifft(Xl);
  sound(xl, Fs);
  
  while 1
    fc = input(['Seleccione la frecuencia de corte para el filtrado paso'...
      ' baja (entre 0 y 0.5): ']);
    if fc && (fc >= 0 && fc <= 0.5)
      h = lp_filter(L, fc, 'Hann');
      reconstructed_audio = cconv(h, xl);
      sound (reconstructed_audio, Fs);
      if input(['Para confirmar audio, pulse 1 y después ENTER.' ...
          ' Pulse ENTER para ajustar la frecuencia: ']) == 1
        gain = input(['Si lo desea, introduzca un valor de ganancia: ']);
        if isempty(gain) || gain <= 0
          gain = 1;
        end
        audiowrite('audio/3-reconstructed_audio.wav', reconstructed_audio * gain, Fs);
        break;
      end
    end
    clc
  end
  
  str = ['reconstrucción del audio original filtrado'];
  audio_analysis('audio/3-reconstructed_audio.wav', str, [0.1 0.2 0.8]);
end

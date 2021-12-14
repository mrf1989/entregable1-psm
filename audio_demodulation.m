function audio_demodulation(audio_signal, F, L, window)
  [x, Fs] = audioread(audio_signal);
  
  disp(['Frecuencia de demodulación: ' num2str(F) ' Hz']);
  
  demodulated_audio = fq_shift(x, F);
  
  audiowrite('audio/3-demodulated_audio.wav', demodulated_audio, Fs);
  str = ['demodulado a una frecuencia de ' num2str(F/1000) ' kHz'];
  audio_analysis('audio/3-demodulated_audio.wav', str, [0.2 0.7 0.8]);
  
  while 1
    fc = input(['Seleccione la frecuencia de corte para el filtrado paso'...
      ' baja (entre 0 y 0.5): ']);
    if fc && (fc >= 0 && fc <= 0.5)
      h = lp_filter(L, fc, window);
      reconstructed_audio = cconv(h, demodulated_audio);
      sound (reconstructed_audio, Fs);
      if input(['Para confirmar audio, pulse 1 y después ENTER.' ...
          ' Pulse ENTER para ajustar la frecuencia: ']) == 1
        gain = input(['Si lo desea, introduzca un factor de ganancia (dB): ']);
        if isempty(gain) || gain <= 0
          gain = 1;
        end
        audiowrite('audio/4-reconstructed_audio.wav', reconstructed_audio * gain, Fs);
        disp('Reproduciendo señal reconstruida...');
        break;
      end
    end
    clc
    sound (demodulated_audio, Fs);
  end
  
  str = ['reconstrucción del audio original filtrado'];
  audio_analysis('audio/4-reconstructed_audio.wav', str, [0.1 0.2 0.8]);
end

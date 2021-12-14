function modulated_audio = audio_modulation(audio_signal)
  [x, Fs] = audioread(audio_signal);
  
  F = input(['Seleccione la frecuencia en Hz de la señal moduladora (ENTER, '...
    'por defecto 80000): ']);
    
  if isempty(F)
    F = 80000;
  end
  
  disp(['Frecuencia de modulación: ' num2str(F) ' Hz']);
  
  modulated_audio = fq_shift(x, F);
  
  audiowrite('audio/2-modulated_audio.wav', modulated_audio, Fs);
  str = ['filtrado desplazado en frecuencia ' num2str(F/1000) ' kHz'];
  audio_analysis('audio/2-modulated_audio.wav', str, [0.8 0.7 0.2]);
end
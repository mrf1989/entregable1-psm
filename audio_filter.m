function [filtered_audio, order, w] = audio_filter(audio, Fs)
  Fc = input(['Seleccione la frecuencia de corte en Hz para el filtro paso'...
    ' baja (ENTER, por defecto 6000 Hz): ']);
    
  if isempty(Fc)
    Fc = 6000;
  else
    Fc = abs(Fc);
  end
  
  disp(['Frecuencia de corte paso baja: ' num2str(Fc) ' Hz.']);
  
  L = input('Seleccione el orden impar del filtro (ENTER, por defecto 51): ');
  
  if isempty(L)
    L = 51;
  elseif mod(L, 2) == 0
    L = L + 1;
  end
  
  order = L;
  disp(['Orden del filtro: ' num2str(L) '.']);
  
  window = input(['Seleccione la ventana de filtrado (Hann [1], Hamming [2] o'...
    ' Blackman [3]): ']);
  
  fc = Fc/Fs;
  h = lp_filter(L, fc, window);
  filtered_audio = cconv(h,audio);
  
  w = window;
  
  audiowrite('audio/1-filtered_audio.wav', filtered_audio, Fs);
  str = ['filtrado a ' num2str(Fc/1000) ' kHz'];
  audio_analysis('audio/1-filtered_audio.wav', str, [0.4 0.1 0.9]);
end

function [out, X] = audio_filter(audio, L, Fc, Fs, window)
  if nargin == 4
    window = 'Square';
  end
  
  fc = Fc/Fs;
  h = lp_filter(L, fc, window);
  out = conv(h,audio);
  X = fft(out);
  audiowrite('audio/1-filtered_audio.wav', out, Fs);
  str = ['filtrado a ' num2str(Fc/1000) ' kHz ' 'con ventana ' window];
  audio_analysis('audio/1-filtered_audio.wav', str);
end

function [record, Fs] = audio_analysis(audio, str)
  [record Fs] = audioread(audio);
  record = record(:, 1);
  N = length(record);
  
  % dft analysis
  X = fft(record);
  
  % plotting
  figure("name", "Análisis de audio");
  
  subplot(211);
  n = 0:N-1;
  plot(n, record);
  title(['Audio: ' str]);
  
  subplot(212);
  k = n;
  stem(k/N, abs(X));
  title('Espectro frecuencial del audio');
  
  % reproducing
  sound(record, Fs);
end

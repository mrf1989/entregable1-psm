function [record, Fs] = audio_analysis(audio, str, color)
  [record Fs] = audioread(audio);
  record = record(:, 1);
  N = length(record);
  
  % dft analysis
  X = fft(record);
  
  % plotting
  figure('name', 'Análisis de audio', 'position', [100 350 1000 500]);
  
  subplot(211);
  n = 0:N-1;
  plot(n/100000, record, 'color', color);
  title(['Audio: ' str], 'fontsize', 20);
  
  subplot(212);
  k = n;
  stem(k/N, abs(X));
  title('Espectro frecuencial del audio', 'fontsize', 18);
  
  % reproducing
  sound(record, Fs);
end

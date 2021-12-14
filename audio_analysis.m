function [record, Fs] = audio_analysis(audio, str, color)
  [record Fs] = audioread(audio);
  record = record(:, 1);
  N = length(record);
  
  % dft analysis
  X = fft(record);
  
  % plotting
  figure('name', 'Análisis de audio', 'position', [100 350 1350 600]);
  
  subplot(211);
  n = 0:N-1;
  plot(n/100000, record, 'color', color);
  axis([0 (N-1)/100000 -0.4 0.4]);
  title(['Audio: ' str], 'fontsize', 20);
  xlabel('segundos');
  ylabel('dB');
  
  subplot(212);
  k = n;
  stem(k/N, abs(X));
  title('Espectro frecuencial del audio', 'fontsize', 18);
  xlabel('f');
  ylabel('|DFT(x)|');
  
  % reproducing
  sound(record, Fs);
end

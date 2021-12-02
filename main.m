%   ENTREGABLE 1 de PSM
% 
%   Título: Desplazamiento frecuencial de señales de audio
%   Autor: Mario Ruano Fernández < mruano@us.es >
%   Versión: v2.0
%   Fecha: 12/2021

clear all
close all
clc


% Recording...

[record, Fs] = audio_analysis('psm.wav', 'original', [0.2 0.7 0.1]);


% Step 1. Filtering

Fc = 6000;
L = 51;
[processed_audio, X]= audio_filter(record, L, Fc, Fs, 'Hann');


% Step 2. Shifting frecuency

shift = 80000;
Xl = circshift(X, shift);
fq_shifted_audio = ifft(Xl);
audiowrite('audio/2-fq_shifted_audio.wav', fq_shifted_audio, Fs);
str = ['filtrado desplazado en frecuencia ' num2str(shift/1000) ' kHz'];
audio_analysis('audio/2-fq_shifted_audio.wav', str, [0.8 0.7 0.2]);


% Step 3. Reconstructing

audio_reconstruction('audio/2-fq_shifted_audio.wav', shift, L, Fs);

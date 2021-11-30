%   ENTREGABLE 1 de PSM
% 
%   T�tulo: Desplazamiento frecuencial de se�ales de audio
%   Autor: Mario Ruano Fern�ndez < mruano@us.es >
%   Versi�n: v1.0
%   Fecha: 13/12/2021

clear all
close all
clc


% Recording...

[record, Fs] = audio_analysis('psm.wav', 'original');


% Step 1. Filtering

Fc = 6000;
L = 51;
processed_audio = audio_filter(record, L, Fc, Fs, 'Hann');


% Step 2. Shifting frecuency

shift = 8000;
fq_shifted_audio = fq_shift(processed_audio, shift);
audiowrite('audio/2-fq_shifted_audio.wav', fq_shifted_audio, Fs);
str = ['filtrado desplazado en frecuencia ' num2str(shift/1000) ' kHz'];
audio_analysis('audio/2-fq_shifted_audio.wav', str);


% Step 3. Reconstructing

reconstructed_audio = fq_shift(fq_shifted_audio, -shift);
audiowrite('audio/3-reconstructed_audio.wav', reconstructed_audio, Fs);
str = ['reconstrucci�n del audio original filtrado'];
audio_analysis('audio/3-reconstructed_audio.wav', str);

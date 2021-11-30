%   ENTREGABLE 1 de PSM
% 
%   Título: Desplazamiento frecuencial de señales de audio
%   Autor: Mario Ruano Fernández < mruano@us.es >
%   Versión: v1.0
%   Fecha: 13/12/2021

clear all
close all
clc

% Step 1.

[x, Fs] = audio_analysis('psm.wav', 'original');

% Process low-pass filtering 6kHz
Fc = 6000;
L = 51;
processed_audio = audio_filter(x, L, Fc, Fs);


% Step 2.

shift = 34000;
fq_shifted_audio = fq_shift(processed_audio, shift);
audiowrite('fq_shifted_audio.wav', fq_shifted_audio, Fs);
str = ['filtrado desplazado en frecuencia ' num2str(shift/1000) ' kHz'];
audio_analysis('fq_shifted_audio.wav', str);

%      O
%      |
%      |
%      |
% transmission
%      |
%      |
%      |
%      V

% Step 3.

reconstructed_audio = fq_shift(fq_shifted_audio, -shift);
audiowrite('reconstructed_audio.wav', reconstructed_audio, Fs);
str = ['reconstrucción del audio original filtrado'];
audio_analysis('reconstructed_audio.wav', str);

%   ENTREGABLE 1 de PSM
% 
%   Título: Desplazamiento frecuencial de señales de audio
%   Autor: Mario Ruano Fernández < mruano@us.es >
%   Versión: v3.0
%   Fecha: 12/2021


% Step 0. Starting...

clear all
close all
clc

% Dependencies
pkg load signal

% Recording...
[record, Fs] = audio_analysis('audio/psm.wav', 'original', [0.2 0.7 0.1]);

% ------------------------------------------------------------------------------

% Step 1. Filtering

[filtered_audio, L, window] = audio_filter(record, Fs);

% ------------------------------------------------------------------------------

% Step 2. Shifting frecuency

[fq_shifted_audio, shift] = audio_modulation('audio/1-filtered_audio.wav');

% ------------------------------------------------------------------------------

% Step 3. Reconstructing

audio_demodulation('audio/2-modulated_audio.wav', shift, L, window);

% ------------------------------------------------------------------------------

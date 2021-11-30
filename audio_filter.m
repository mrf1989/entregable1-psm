function out = audio_filter(audio, L, Fc, Fs)
  fc = Fc/Fs;
  [h, H] = lp_filter(L, fc);
  out = conv(h,audio);
  audiowrite('filtered_audio.wav', out, Fs);
  audio_analysis('filtered_audio.wav', ['filtrado a ' num2str(Fc/1000) ' kHz']);
end

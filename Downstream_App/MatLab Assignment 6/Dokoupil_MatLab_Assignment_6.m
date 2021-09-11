% John Dokoupil
% ECE 714 ? Fall ?16
% MatLab Assignment 6

clear;
close all;

% =============== 1 ================

[x32, fs] = audioread('speech6.wav');
sound(x32,fs);

% =============== 2 ================

t = (0:length(x32)-1)/fs;

figure( 2 );
plot( t, x32 );
ylim([-1.2 1.2]);
title( 'Original Audio Signal' );
xlabel( 'Time(sec)' );
ylabel( 'x32(t)' );

% =============== 3 ================

f = (0:length(x32)-1)/length(x32) * fs;
X32 = abs(fft(x32))/length(x32);

figure( 3 );
plot( f, X32 );
xlim([0 fs]);
ylim([0 0.01]);
title('Normalized Frequency Spectrum');
xlabel('Frequency(Hz)')
ylabel('|X32(f)|')

% =============== 4 ================

pause( 3 );
x32d8 = x32( 1:4:length(x32) );
fsd8 = fs/4;
sound( x32d8, fsd8 );

% =============== 5 ================

td8 = (0:length(x32d8)-1)/fsd8;

figure( 5 );
plot( td8, x32d8 );
ylim([-1.2 1.2]);
title( 'Downsampled(x4) Audio Signal' );
xlabel( 'Time(sec)' );
ylabel( 'x32d8(t)' );

% =============== 6 ================

fd8 = (0:length(x32d8)-1)/length(x32d8) * fsd8;
X32d8 = abs(fft(x32d8))/length(x32d8);

figure( 6 );
plot( fd8, X32d8 );
xlim([0 fsd8]);
ylim([0 0.01]);
title( 'Normalized Frequency Sprectrum (Downsampled x4)' );
xlabel( 'Frequency(Hz)' );
ylabel( '|X32d8(f)|' );

% =============== 7 ================

fir = fir1( 64, .25 );

figure( 7 );
stem( fir );
title( 'Anti-aliasing FIR Filter' );
xlabel( 'Filter Term Coefficients' );
ylabel( '|coefficients|' );

% =============== 8 ================

figure( 8 );
freqz( fir, 1, 'whole' );
title( 'Frequency Response of Filter' );

% =============== 9 ================

x32f = filter( fir, 1, x32 );
pause( 3 );
sound( x32f, fs );

% =============== 10 ================

f_x32f = (0:(length(x32f)-1))/length(x32f) * fs;
X32f = abs(fft(x32f))/length(x32f);

figure( 10 );
plot( f_x32f, X32f );
xlim([0 fs]);
ylim([0 0.01]);
title( 'Frequency Response of Filtered Audio Signal' );
xlabel( 'Frequency(Hz)' );
ylabel( '|X32f(f)|' );

% =============== 11 ================

pause( 3 );
x32fd8 = x32f(1:4:length(x32f));
sound( x32fd8, fs/4 );

% =============== 12 ================

tfd8 = (0:length(x32fd8)-1)/fsd8;

figure( 12 );
plot( tfd8, x32fd8 );
ylim([-1.2 1.2]);
title( 'Filtered Audio Sample (Downsample x4)' );

% =============== 13 ================

f_x32fd8 = (0:length(x32fd8)-1)/length(x32fd8) * fsd8;
X32fd8 = abs(fft(x32fd8))/length(x32fd8);

figure( 13 );
plot( f_x32fd8, X32fd8 );
xlim([0 fsd8]);
ylim([0 0.01]);
title( 'Normalized Frequency Spectrum - Filtered, Downsampled (x4) Signal');
xlabel( 'Frequency(Hz)' );
ylabel( '|X32fd8(f)|' );

% =============== 14 ================

pause( 3 );
x32fd8u32(4*(1:length(x32fd8))) = x32fd8(1:length(x32fd8));
sound( x32fd8u32, fs );

% =============== 15 ================

td8u32 = (0:length(x32fd8u32)-1)/fs;

figure( 15 );
plot( td8u32, x32fd8u32 );
ylim([-1.2 1.2]);
title( 'Upsampled Audio Signal' );
xlabel( 'Time(sec)' );
ylabel( 'x32fd8u32(t)' );

% =============== 16 ================

fd8u32 = (0:length(x32fd8u32)-1)/length(x32fd8u32) * fs;
X32fd8u32 = abs(fft(x32fd8u32))/length(x32fd8u32);

figure( 16 );
plot( fd8u32, X32fd8u32 );
ylim([0 0.01]);
title( 'Frequency Response - Upsampled (x4)' );
xlabel( 'Frequency(Hz)' );
ylabel( '|X32fd8u32(f)|' );

% =============== 17 ================

pause( 3 );
x32fd8u32f = 4 * filter( fir, 1, x32fd8u32 );
sound( x32fd8u32f, fs );

% =============== 18 ================

figure( 18 );
plot( td8u32, x32fd8u32f );
ylim([-1.2 1.2]);
title( 'Upsampled (x4), Filtered Audio Sample' );
xlabel( 'Time(sec)' );
ylabel( 'x32fd8u32f(t)' );

% =============== 19 ================

X32fd8u32f = abs(fft(x32fd8u32f))/length(x32fd8u32f);

figure( 19 );
plot( fd8u32, X32fd8u32f );
xlim([0 fs]);
ylim([0 0.01]);
title( 'Frequency Response of Filtered, Upsampled (x4) Audio Sample' );
xlabel( 'Frequency(Hz)' );
ylabel( '|X32fd8u32f(f)|' );


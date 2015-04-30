%%load file
[y,Fs] = wavread('signal-andno037.wav');

%% get delay
[acor,lag]=xcorr(y);
plot(lag/Fs,acor)

% from plot we get this
delay=0.390;
%% remove the echo
count=1
for i=[delay*Fs+1:length(y)]
    y(i)=y(i)-0.9*y(count)
    count=count+1
end
%% get fc
yf=fft(y);
plot(abs(yf))


%% demodulera





%%play sound
soundsc(y(1:10:length(y)),40000)
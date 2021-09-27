
%function []= arduinoCode(val)
%%

function [] = arduinoCode()

ard=arduino('COM3','uno');
%arduinoCode(1);
disp('on');
writeDigitalPin(ard, 'D13', 1);
pause(3);
end

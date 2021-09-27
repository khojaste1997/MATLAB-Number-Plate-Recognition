function [] = DoorNotOpen()
ard=arduino('COM3','uno');
%arduinoCode(1);
disp('off');
writeDigitalPin(ard, 'D13', 0);
%pause(3);
end
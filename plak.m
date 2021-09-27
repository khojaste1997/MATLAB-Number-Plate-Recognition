function [z]= plak(ch1,ch2,ch3,ch4,ch5,ch6,ch7,ch8)
plak1="34dal31966";
plak2="12shin36511";
plak3="12vilcher36511";
plak4="75ta72866";
plak5="21kaf27159";
c1=num2str(tashkhisChar1(ch1));
c2=num2str(tashkhisChar2(ch2));
c3=num2str(tashkhisChar3(ch3));
c4=num2str(tashkhisChar4(ch4));
c5=num2str(tashkhisChar5(ch5));
c6=num2str(tashkhisChar6(ch6));
c7=num2str(tashkhisChar7(ch7));
c8=num2str(tashkhisChar8(ch8));
%disp(c3);
%disp(plak3);
plakfinal=strcat(c1,c2,c3,c4,c5,c6,c7,c8);
disp(plakfinal);
if(plakfinal==plak1 ||plakfinal==plak2||plakfinal==plak3||plakfinal==plak4||plakfinal==plak5)
    z=1;
else
    z=0;
end
end
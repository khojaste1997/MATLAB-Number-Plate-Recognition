function [] = WarningIOT()
%pic=imread();
%gmailModir =    'fatemehkhj97@gmail.com'; %to
gmailModir =    'fatemekhd1997@gmail.com'; %to
myAddress= 'yourEmail@gmail.com'; %From
myPass='yourPassword';

setpref('Internet','SMTP_Server','smtp.gmail.com');
setpref('Internet','E_mail',myAddress);
setpref('Internet','SMTP_Username',myAddress);
setpref('Internet','SMTP_Password',myPass);

props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth',                'true');  % Note: 'true' as a string, not a logical value!
props.setProperty('mail.smtp.starttls.enable',     'true');  % Note: 'true' as a string, not a logical value!
props.setProperty('mail.smtp.socketFactory.port',  '465');   % Note: '465'  as a string, not a numeric value!
props.setProperty('mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory');

sendmail(gmailModir,'warning','mashin gheir mojaz ghasd vorod be parking ra dashte ast.');

end
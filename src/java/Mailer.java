
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mailer {
	private static final String SMTP_HOST_NAME = "smtp.gmail.com";
	private static final String SMTP_PORT = "587";
	private static final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
	private static final String fromEmail = "vivekranjansahoo81@gmail.com";
	private static final String fromPassword = "xqpvlizmgfppoaww";
	
	public boolean sendMail(String to, String subject, String body) {
		
		
		Properties props = new Properties();    
	    props.put("mail.smtp.host", SMTP_HOST_NAME);    
	    props.put("mail.smtp.socketFactory.port", SMTP_PORT);    
	    props.put("mail.smtp.socketFactory.class", SSL_FACTORY);    
	    props.put("mail.smtp.port", SMTP_PORT); 
	    props.put("mail.smtp.auth", "true");    
	    props.put("mail.smtp.starttls.enable", true);
	    props.put("mail.smtp.ssl.trust", SMTP_HOST_NAME);
	    
		
		
	    //get Session   
	    Session session = Session.getDefaultInstance(props,    
	     new javax.mail.Authenticator() {    
	     protected PasswordAuthentication getPasswordAuthentication() {    
	     return new PasswordAuthentication(fromEmail,fromPassword);  
	     }    
	    });  
	    
	    
	    try {    
	    //compose message   
	     MimeMessage message = new MimeMessage(session);    
	     message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
	     message.setFrom(fromEmail);
	     message.setSubject(subject);    
	     message.setContent(body, "text/html");
	     
	     //send message  
	     Transport.send(message);    
	     System.out.println("message sent successfully"); 
	     return true;
	    } catch (MessagingException e) {
	    	e.printStackTrace();
	    	return false;
	    }     
	}  
}

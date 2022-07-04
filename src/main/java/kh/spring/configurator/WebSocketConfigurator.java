package kh.spring.configurator;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.websocket.HandshakeResponse;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpointConfig;
import javax.websocket.server.ServerEndpointConfig.Configurator;

public class WebSocketConfigurator extends Configurator{
	public void modifyHandshake(ServerEndpointConfig sec,HandshakeRequest request,HandshakeResponse response) {
		HttpSession session = (HttpSession)request.getHttpSession();
		
		sec.getUserProperties().put("hSession",session);
		
		ServletContext ctx= session.getServletContext();
		
	}
}

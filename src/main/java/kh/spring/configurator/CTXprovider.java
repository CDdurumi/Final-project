package kh.spring.configurator;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

@Component
public class CTXprovider implements ApplicationContextAware{
	
	public static ApplicationContext ctx;
	
	@Override
	public void setApplicationContext(ApplicationContext applicationContext ) throws BeansException{
		this.ctx = applicationContext;
	}
}

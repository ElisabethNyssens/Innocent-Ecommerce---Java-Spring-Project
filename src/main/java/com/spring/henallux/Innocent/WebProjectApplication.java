package com.spring.henallux.Innocent;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EnableTransactionManagement
public class WebProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(WebProjectApplication.class, args);

		//commandes docker si modif de la BD

		//docker container rm innocent
		//docker image rm innocent
		//docker build -t innocent .
		//docker run --name innocent -p 3306:3306 -e MYSQL_ROOT_PASSWORD=smoothies -d innocent

		System.out.println("Mot de passe jukru : 'supermotdepasse'");
		System.out.println("Mot de passe prof : 'javacestcool'");
		System.out.println("Mot de passe babette : 'vivelessmoothies'");
	}

}

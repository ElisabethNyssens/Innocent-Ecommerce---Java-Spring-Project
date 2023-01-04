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

		System.out.println("Mot de passe jukru 'supermotdepasse' :");
		// $2a$10$GVFQnQf7n7GTqOS7LUI2yOJzkTmYaLRcUiZ4rmbyFN9GLFJ6vfnMC

		System.out.println("Mot de passe prof 'javacestcool' :");
		// $2a$10$1IeIZDXWR9Q91hsxxOp5k.0p12c/v7.whXDoQMrAjUuk0WhU.N6OW

		System.out.println("Mot de passe babette 'vivelessmoothies' :");
		// $2a$10$p6eWvzypv6youbWFQiYaBe./5eDEbFNEWp.KUfOrmRi/VQ0jw/8L2
	}

}

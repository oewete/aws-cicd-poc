package one.aegon.springbootwebapp;

import java.util.Arrays;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.boot.autoconfigure.SpringBootApplication;

import org.springframework.boot.SpringApplication;

import org.springframework.context.ConfigurableApplicationContext;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
class HelloWorld {

    @RequestMapping("/")
    public String sayHi() {
        return "Hello World!";
    }
}

// The scanBasePackageClasses = HelloWorld.class is not really necessary in
// this case. It is used when the class we are referencing is in a different
// package than the class we are referencing it from, which is not the case.
@SpringBootApplication(scanBasePackageClasses = HelloWorld.class)
public class App {
    private static Logger logger = LoggerFactory.getLogger(App.class);

    public static void main(String[] args)  throws Exception {
        ConfigurableApplicationContext ctx = SpringApplication.run(App.class, args);
        assert (ctx != null);
        logger.info("Application started...");
    }
}

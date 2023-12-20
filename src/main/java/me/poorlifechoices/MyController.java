package me.poorlifechoices;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
class MyController {
    @Value("${my-value.message}")
    String value;

    @GetMapping("/")
    public String helloWorld() {
        return value;
    }
}

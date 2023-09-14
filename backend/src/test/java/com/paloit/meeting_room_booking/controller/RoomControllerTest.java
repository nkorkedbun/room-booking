package com.paloit.meeting_room_booking.controller;

import org.hamcrest.Matchers;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.server.LocalServerPort;

import io.restassured.RestAssured;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class RoomControllerTest {
    
    @LocalServerPort
    private int port;
    
    @BeforeEach
    void setup(){
        RestAssured.port = port;
        RestAssured.baseURI = "http://localhost";
    }

    @Test
    void whenGetAllRoom_shouldResponse200(){
        RestAssured.given()
            .when()
                .get("/booking-svc/api/v1/room")
            .then()
                .statusCode(200)
                .assertThat().body("isEmpty()", Matchers.is(false));
    }
}

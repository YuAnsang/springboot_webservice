package com.github.asyu.webservice.web.dto;

import org.junit.Test;

import static org.assertj.core.api.Assertions.assertThat;

public class HelloResponseDtoTest {

    @Test
    public void test_lombok() {
        // given
        String name = "test";
        int amount = 1000;

        // when
        HelloResponseDto response = new HelloResponseDto(name, amount);

        // then
        assertThat(response.getName()).isEqualTo(name);
        assertThat(response.getAmount()).isEqualTo(amount);

    }

}
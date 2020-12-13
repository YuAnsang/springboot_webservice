package com.github.asyu.webservice.config.auth.dto;

import com.github.asyu.webservice.domain.user.User;
import lombok.Builder;
import lombok.Getter;

import java.io.Serializable;

@Getter
public class SessionUser implements Serializable {

    private String name;

    private String email;

    private String picture;

    @Builder
    public SessionUser(User user) {
        this.name = user.getName();
        this.email = user.getEmail();
        this.picture = user.getPicture();
    }
}